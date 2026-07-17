class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.2/roost-darwin-arm64"
      sha256 "9a3c8a268f8d31aae222c0ab1626ad301784b9c253e034bda8f6c5839ba4a66c"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.2/roost-darwin-amd64"
      sha256 "01a546c18d65f9bfe1292cc5375e9e39ff65bc58688241691515c38614d109f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.2/roost-linux-arm64"
      sha256 "5de4cf03903c4ad95056eb08c46b9735936cc6bfc9d94da42dda6c3e884a47f9"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.3.2/roost-linux-amd64"
      sha256 "9764011da85637f2b6d337c2f7f8f207edda5cce781ca750ea82fa4ba9ae895d"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
