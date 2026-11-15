class Roost < Formula
  desc "Non-custodial CLI for concentrated-liquidity positions on multiple DEXes"
  homepage "https://github.com/sanyu/roost-cli"
  url "https://github.com/sanyu/roost-cli/releases/download/v4.3.0/roost-darwin-arm64"
  sha256 "7e0a44301c5222beb42d8efd10a9a1f55dc893f446b708346ee7e3614c04e33a"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
