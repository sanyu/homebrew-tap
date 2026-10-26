class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "4.1.0"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/sanyu/roost-cli/releases/download/v4.1.0/roost-darwin-arm64"
  sha256 "d16cc6b58f5fb2ea7f5032b1ea92b8a8d9befabdcc74e83e199025751a65e9e1"

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
