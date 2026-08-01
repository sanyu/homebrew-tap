class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.9.1/roost-darwin-arm64"
      sha256 "ab22bb9a2bb4bc3d72f73978ecc019b4afc1cfd6d106704a93ecb37fae922efb"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.9.1/roost-darwin-amd64"
      sha256 "012e1d039cafed5cd06d834a3e13d64323aded65cc5a23f4bc9002bf8e463b62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.9.1/roost-linux-arm64"
      sha256 "a1089e486eff9cb6aa88245abcc433767e3883f4c2b6ee21dc45cbbb2e655f60"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.9.1/roost-linux-amd64"
      sha256 "aa9417073a4abe5044e56f47ed18fd816ae1e0d12e18d4fb478d0cea494e9199"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
