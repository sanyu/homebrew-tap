class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "4.0.0"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/sanyu/roost-cli/releases/download/v4.0.0/roost-darwin-arm64"
  sha256 "55d58816a61141bed6734c70a33f240495d36894b3dd9a9d9d659dfb40ad7dcd"

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
