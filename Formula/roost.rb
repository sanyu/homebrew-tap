class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "1.0.0"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/sanyu/roost-cli/releases/download/v1.0.0/roost-darwin-arm64"
  sha256 "43e5ce421e34e3a1e6ef5b216deee35eb66a1dbcfa31486a93b5bd9580e6fe6a"

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
