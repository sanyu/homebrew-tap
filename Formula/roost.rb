class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.0/roost-darwin-arm64"
      sha256 "4ec27ab7c3fa7373b5d14522ab23f726f1a3947036276a2fe78fbeee5f469311"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.0/roost-darwin-amd64"
      sha256 "b796be555c8ddca9a5da6422c1d59ea4c7a0f557b9b4535fe4bc5c5182d23f78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.0/roost-linux-arm64"
      sha256 "6d68d93ac3c85b2d784642e26965b8d77f7938ef9eca3caa613082a3d7c5c344"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.0/roost-linux-amd64"
      sha256 "7a4da24fda18cb12ed1b2090a8b944840430d3c88ffc688f57b71d77b963e10a"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
