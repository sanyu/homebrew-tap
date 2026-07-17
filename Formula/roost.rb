class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.1/roost-darwin-arm64"
      sha256 "ac8c7ff3d4ea6133eab1a6fa3485c5b2ae199e20832ee81a9742abd32cbe101c"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.1/roost-darwin-amd64"
      sha256 "8a0d50895313b3c7014133837d7878aaef8cc0b251ee73b43e9c855e60bfbdc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.1/roost-linux-arm64"
      sha256 "2460a1bc5a506656841246ee08c9d33e5de2d215d8d2491076a76d665d700c5f"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.1/roost-linux-amd64"
      sha256 "1d8020c214545964515d3b010ee6b6e86f0d495bd21f5630d31119d75f136c5f"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
