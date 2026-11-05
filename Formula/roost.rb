class Roost < Formula
  desc "Non-custodial CLI for concentrated-liquidity positions on multiple DEXes"
  homepage "https://github.com/sanyu/roost-cli"
  url "https://github.com/sanyu/roost-cli/releases/download/v4.2.0/roost-darwin-arm64"
  sha256 "b35d13ee90adeb0e175242e1b3340ca645032a386a72d4936a972f84fe21eb4b"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
