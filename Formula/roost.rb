class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.11.0/roost-darwin-arm64"
      sha256 "8eb1b75957dbecbcdb154665c67aece17f81e87365918d881a38bc3efb2a8925"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.11.0/roost-darwin-amd64"
      sha256 "692e6698c846269ce7d81563d223142860a621c2abe2552824b90551b841167f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.11.0/roost-linux-arm64"
      sha256 "dc2f96f5067b5a25e5e6a3912b2e6807b7cdc3ccf121f2404b046d6601b4c460"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.11.0/roost-linux-amd64"
      sha256 "25f0500e53697d2c4b0e7d861211eed535d292bfa86eccdb0354eab116c1af1a"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
