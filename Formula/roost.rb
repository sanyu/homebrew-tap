class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.13.0/roost-darwin-arm64"
      sha256 "c7205bd2fe16e1b271947669ce941a1ed163b965f31934bc12e603ceb3ef913a"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.13.0/roost-darwin-amd64"
      sha256 "84bcbf5003496dca2270a9addf2170a62ff7ab30a4ecd2dc71fa6d2212d8ed19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.13.0/roost-linux-arm64"
      sha256 "990e73d0e02b735c9ff122628944df8ab5a6dc60bd4af194ea1aeed2f98d2118"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.13.0/roost-linux-amd64"
      sha256 "dde83c028504c12cfef158e5ef7f8f56736f4dc1fd2caae14271be35a2a52615"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
