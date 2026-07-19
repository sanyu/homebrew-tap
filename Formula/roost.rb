class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.5.0/roost-darwin-arm64"
      sha256 "31941dd66f9ff3e01724ec608a43210bb12371a71bb3623baff23026c3f5f989"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.5.0/roost-darwin-amd64"
      sha256 "aa7f0fe9f285ab0fffd23f232128adf7a8743984bc8c2676e571f8f0023c358f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.5.0/roost-linux-arm64"
      sha256 "bdffcdf87ba6830027188be3d2db40287ce18aed55e72d0ff8039412863fa60c"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.5.0/roost-linux-amd64"
      sha256 "b3a49c7fb03abf2ae943f4d134ce0012518d2db4072827379d43ee0b006430a2"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
