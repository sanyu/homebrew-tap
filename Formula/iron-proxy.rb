class IronProxy < Formula
  desc "Egress proxy that injects vault-held credentials into allowlisted requests"
  homepage "https://github.com/ironsh/iron-proxy"
  url "https://github.com/ironsh/iron-proxy/archive/refs/tags/v0.54.0.tar.gz"
  sha256 "abcb19103a55d53842aca15550b8c9064487bca6af062143ad5e39c6eac240e0"
  license "Apache-2.0"
  revision 1

  bottle do
    root_url "https://github.com/sanyu/homebrew-tap/releases/download/iron-proxy-0.54.0_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d27d4806afa927af45b0a173d3d25d1ccec181dcfe959c6d81100f7cfa69d75c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f1b90aab7073d8880899826ec4830dbca17b193e7faae64d58bacff6fa66a5b"
  end

  depends_on "go" => :build

  # oauth_token entries may name the placeholder the client sends, so several
  # entries can share one host and each client gets its own token.
  # Upstream PR pending; drop with the release that carries it.
  patch :DATA

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/ironsh/iron-proxy/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/iron-proxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iron-proxy version")
  end
end

__END__
--- a/internal/transform/oauth/oauth.go
+++ b/internal/transform/oauth/oauth.go
@@ -29,6 +29,7 @@
 	"log/slog"
 	"net/http"
 	"net/url"
+	"strings"
 	"sync"
 
 	"golang.org/x/oauth2"
@@ -105,8 +106,14 @@
 	TokenEndpoint string                 `yaml:"token_endpoint,omitempty"`
 	Scopes        []string               `yaml:"scopes,omitempty"`
 	Rules         []hostmatch.RuleConfig `yaml:"rules"`
-	Header        string                 `yaml:"header,omitempty"`
-	ValuePrefix   string                 `yaml:"value_prefix,omitempty"`
+	// Placeholder, when set, narrows the entry to requests whose Header
+	// already carries this value (substring match, e.g. the client sent
+	// "Bearer IRON_LINEAR_LEAD_VFAT"). Several entries may then share one
+	// host; each client picks its token by the placeholder it sends, and a
+	// request without any placeholder matches none of them.
+	Placeholder string `yaml:"placeholder,omitempty"`
+	Header      string `yaml:"header,omitempty"`
+	ValuePrefix string `yaml:"value_prefix,omitempty"`
 
 	// Require rejects the request with a 502 when the token cannot be minted.
 	// When false (default), a mint failure is logged and the request is
@@ -139,6 +146,7 @@
 	rules       []hostmatch.Rule
 	header      string
 	valuePrefix string
+	placeholder string // narrows the match to requests already carrying it in header
 	cfgEndpoint string // config token_endpoint
 	audience    string // JWT "aud" claim, jwt_bearer grant only
 	require     bool   // reject the request when minting fails
@@ -252,6 +260,7 @@
 		rules:                 rules,
 		header:                header,
 		valuePrefix:           valuePrefix,
+		placeholder:           tc.Placeholder,
 		cfgEndpoint:           tc.TokenEndpoint,
 		audience:              tc.Audience,
 		require:               tc.Require,
@@ -439,12 +448,18 @@
 	return &transform.TransformResult{Action: transform.ActionContinue}, nil
 }
 
-// matchEntry returns the first entry whose host rules match req, or nil.
+// matchEntry returns the first entry whose host rules match req, or nil. An
+// entry with a placeholder also needs that placeholder in the request's
+// header, so entries for one host are told apart by what the client sent.
 func (o *OAuth) matchEntry(req *http.Request) *tokenEntry {
 	for _, e := range o.entries {
-		if hostmatch.MatchAnyRule(e.rules, req) {
-			return e
+		if !hostmatch.MatchAnyRule(e.rules, req) {
+			continue
 		}
+		if e.placeholder != "" && !strings.Contains(req.Header.Get(e.header), e.placeholder) {
+			continue
+		}
+		return e
 	}
 	return nil
 }
--- a/internal/transform/oauth/oauth_test.go
+++ b/internal/transform/oauth/oauth_test.go
@@ -587,6 +587,50 @@
 	_, err := o.TransformRequest(context.Background(), newContext(), req)
 	require.NoError(t, err)
 	require.Equal(t, "Bearer token-for-first", req.Header.Get("Authorization"))
+}
+
+// Scenario: two entries share one host and differ only by placeholder. The
+// request carrying the second placeholder gets the second token; a request
+// with no placeholder matches neither entry and is forwarded untouched.
+func TestPlaceholderSelectsEntryOnSharedHost(t *testing.T) {
+	srv := newTokenServer(t, func(form url.Values) (int, map[string]any) {
+		return http.StatusOK, map[string]any{
+			"access_token": "token-for-" + form.Get("scope"),
+			"token_type":   "Bearer",
+			"expires_in":   3600,
+		}
+	})
+	o := buildTransformWith(t, `
+tokens:
+  - grant: client_credentials
+    client_id: {type: env, var: CID}
+    client_secret: {type: env, var: CSECRET}
+    token_endpoint: "`+srv.URL+`/token"
+    scopes: ["roost"]
+    placeholder: IRON_LEAD_ROOST
+    rules:
+      - host: "api.example.com"
+  - grant: client_credentials
+    client_id: {type: env, var: CID}
+    client_secret: {type: env, var: CSECRET}
+    token_endpoint: "`+srv.URL+`/token"
+    scopes: ["vfat"]
+    placeholder: IRON_LEAD_VFAT
+    rules:
+      - host: "api.example.com"
+`, ccBuilder())
+
+	req := newRequest(t, http.MethodGet, "https://api.example.com/v1/x")
+	req.Header.Set("Authorization", "Bearer IRON_LEAD_VFAT")
+	_, err := o.TransformRequest(context.Background(), newContext(), req)
+	require.NoError(t, err)
+	require.Equal(t, "Bearer token-for-vfat", req.Header.Get("Authorization"))
+
+	bare := newRequest(t, http.MethodGet, "https://api.example.com/v1/x")
+	res, err := o.TransformRequest(context.Background(), newContext(), bare)
+	require.NoError(t, err)
+	require.Equal(t, transform.ActionContinue, res.Action)
+	require.Empty(t, bare.Header.Get("Authorization"))
 }
 
 // --- token endpoint stubbing ---
