class IronProxy < Formula
  desc "Egress proxy that injects vault-held credentials into allowlisted requests"
  homepage "https://github.com/ironsh/iron-proxy"
  url "https://github.com/ironsh/iron-proxy/archive/refs/tags/v0.54.0.tar.gz"
  sha256 "abcb19103a55d53842aca15550b8c9064487bca6af062143ad5e39c6eac240e0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/sanyu/homebrew-tap/releases/download/iron-proxy-0.54.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "67c671a059b3f1a9123d3215489b799a2cb831fc73c02a4c1c6c34b274ab0019"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f06dc5bffa51545a85608ba0d164dbec0efe02fdb77573426cfb38afcda1d2c5"
  end

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
