class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.2.0/roost-darwin-arm64"
      sha256 "e5733f96446e46b24daa736542d9ab27e0dd093e65e80b5aa0b1b559b4f090f3"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.2.0/roost-darwin-amd64"
      sha256 "4cc0292cbbf5c906c44ecbf4bfe782d56669bef83ce12bcbd2d2580be6dc16f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.2.0/roost-linux-arm64"
      sha256 "0f80148bdf704cee053888168ba713a9a942c4cb629baebbb2715d84f4ae47e8"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.2.0/roost-linux-amd64"
      sha256 "c6ebd3825d4dfa7b087e793a5f660ab0e0faa9f12c20a9d6021b892b1099998c"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
