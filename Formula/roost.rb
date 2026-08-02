class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.10.0/roost-darwin-arm64"
      sha256 "176e90c1ea9f6134a331493c76b744e77d57cddea11637fa805f845d4ee723b2"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.10.0/roost-darwin-amd64"
      sha256 "782c3b9f7f15ee57026aa811f68b439b5817ba23558b317c0c07758b823bb831"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.10.0/roost-linux-arm64"
      sha256 "164ca2f2bb7568a7d9e55bb8cd45b2254d0db0ac443a5c05ad542f9963f8c8e7"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.10.0/roost-linux-amd64"
      sha256 "ac6b0eac83d869d77897439de05adc82cade43d85ae006e515b72c14195f7fb1"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
