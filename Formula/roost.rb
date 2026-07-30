class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.8.0/roost-darwin-arm64"
      sha256 "16f7388f9a7de144efd2c87e4e13ddd125636a6d9878ad5b9587362f6fc45239"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.8.0/roost-darwin-amd64"
      sha256 "7b34d31afe1c67feb5d100ef8b0801d1a7ff558cf8bb579a1ea678fa0dcc409a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.8.0/roost-linux-arm64"
      sha256 "61e0cefe6e5b086ee6b5bd25d39c118db95aacc7ea50aed1353ba4897d28420e"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.8.0/roost-linux-amd64"
      sha256 "c9060e8d3e0f49c9f0427ef4392a8dff5185d8c2b68c3f3a9913753dcbd36bb2"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
