class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.2.0/roost-darwin-arm64"
      sha256 "4764b154f05f470549e769c9c309c8c75f66a2d601ab7fdeb870f47a23798bb4"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.2.0/roost-darwin-amd64"
      sha256 "538ebf784a03010b5967ad6c6f6f6ef644f35c692f21630bad2baa2d7ca5d489"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.2.0/roost-linux-arm64"
      sha256 "b93e4b788f5d0fc4e699e2f350de4f1da6c70eab5dfeb30ab070a28b6668a270"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.2.0/roost-linux-amd64"
      sha256 "b1039c6942cc3336d9d5f80b3b46442623612297cce192e1bdb003e37c6e0647"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
