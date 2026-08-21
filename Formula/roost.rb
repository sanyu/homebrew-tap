class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.15.0"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/sanyu/roost-cli/releases/download/v0.15.0/roost-darwin-arm64"
  sha256 "1b9a53e38e9ebe5b370bd8a59641e6329c5ae2ad3465bb3816ae571d6f799b5a"

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
