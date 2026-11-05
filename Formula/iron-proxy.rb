class IronProxy < Formula
  desc "Egress proxy that injects vault-held credentials into allowlisted requests"
  homepage "https://github.com/ironsh/iron-proxy"
  url "https://github.com/ironsh/iron-proxy/archive/refs/tags/v0.54.0.tar.gz"
  sha256 "abcb19103a55d53842aca15550b8c9064487bca6af062143ad5e39c6eac240e0"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/ironsh/iron-proxy/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/iron-proxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iron-proxy version")
  end
end
