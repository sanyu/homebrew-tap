class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.7.0/roost-darwin-arm64"
      sha256 "95241660affcf1604c6ca92108aed95857a31b0f05405e52cc4cfec21a090579"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.7.0/roost-darwin-amd64"
      sha256 "3e2eec36319bd737fa3effd45282c088ea42857849d1348f2321d81158890f9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.7.0/roost-linux-arm64"
      sha256 "ee42fc483883a2b24734355e2978723d62ef811678126f3cd28023d101389dd5"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.7.0/roost-linux-amd64"
      sha256 "87092cf37905569b614c86d5746f37a45fa4ae1ff74fc6587781dc106741eaaf"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
