class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "3.0.0"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/sanyu/roost-cli/releases/download/v3.0.0/roost-darwin-arm64"
  sha256 "a50bed1f59b30c893b7c936644e0dce3625ca48db585bbd8e427dfc7dabd0ecc"

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
