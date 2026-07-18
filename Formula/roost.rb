class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.4.0/roost-darwin-arm64"
      sha256 "88b481987e9711d7eca33150d2a7ebf9512571024e227009ff5d6fe8f274c8b6"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.4.0/roost-darwin-amd64"
      sha256 "019ee31fb9a0966b929fe2e1bb07c677539e5d6e7018a6817919613161b5a33f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.4.0/roost-linux-arm64"
      sha256 "6b5c110ab255b976af22b4b826d1d19aff1cea126aef5f5fa5807bdde98bb91d"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.4.0/roost-linux-amd64"
      sha256 "a1e1433fba6841897db6f5aec583bd5e4fa29a727a5e170323cc597c09ca1215"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
