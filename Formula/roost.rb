class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.1.0/roost-darwin-arm64"
      sha256 "ac58d57fa368615ca56e174c04e15cb4e16817367af1393bf8c10c096d9678f2"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.1.0/roost-darwin-amd64"
      sha256 "e3f44fb68090ec89d226a404f19b5caadd6f28e54b14264325b8db892368f2d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.1.0/roost-linux-arm64"
      sha256 "5ba37443b62f91dbf73bd4d1f9e450ea0a36d879da3ec408449bf08307828b81"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.1.0/roost-linux-amd64"
      sha256 "7e635cce36e19b2ae68cd14ea9a9027a2e72cf8a7ad1bb58528f55a38c70f356"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
