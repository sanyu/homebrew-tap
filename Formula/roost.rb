class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.6.0/roost-darwin-arm64"
      sha256 "9f1c42e2523280c6543acb82d85e4ca52c82b2d3861177a0a0837f20cb0cb05e"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.6.0/roost-darwin-amd64"
      sha256 "775f12bed39249c6265235a7e650b8b4734374c87201f1875b2fad7c2eb64ddc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.6.0/roost-linux-arm64"
      sha256 "4f0ba25713175fd8c2b0ecef35d290070a2d4411ad7036b09fb955ba8dcbe421"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.6.0/roost-linux-amd64"
      sha256 "a6a69ced1568345d19555696f0ca0402d34d0736135c40b21b11023c4476bab5"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
