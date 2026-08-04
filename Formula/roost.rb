class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.12.0/roost-darwin-arm64"
      sha256 "230a41b7eed68fe10aace551c00d4fdd982d42ed49caf8d1a8500e625a073b58"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.12.0/roost-darwin-amd64"
      sha256 "cd85073c49dbd0657efd256f694da0ed27390df7a87abc82ce44f3bf36776e6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.12.0/roost-linux-arm64"
      sha256 "324a654d7f603989a5215de1ab520770ae3ed44ad634fec0b4775730be28b7ab"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.12.0/roost-linux-amd64"
      sha256 "e70d6d88cb9b5fe8f58464114446d91c8780d9ef117a30a9d9029b1be4af9f40"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
