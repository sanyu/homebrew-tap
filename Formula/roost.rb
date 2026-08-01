class Roost < Formula
  desc "Non-custodial CLI for Aerodrome single-sided snuggle liquidity positions"
  homepage "https://github.com/sanyu/roost-cli"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.9.0/roost-darwin-arm64"
      sha256 "33e4212970e78a552c6b1d6da6eae1c7027407f0e832100718e590faa049d822"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.9.0/roost-darwin-amd64"
      sha256 "81bf4d7e493b92e028cd81312c25ae82c91985cebaf1ccd3447537afaeb14a04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sanyu/roost-cli/releases/download/v0.9.0/roost-linux-arm64"
      sha256 "5efa5bfd17fd44f3160b91852a82a4b3d2c611141a67187fb4cfa89607eab980"
    else
      url "https://github.com/sanyu/roost-cli/releases/download/v0.9.0/roost-linux-amd64"
      sha256 "3a8899229d666e7719e5622c2e65f91579cd234952fe22ac268987467a7e8098"
    end
  end

  def install
    bin.install Dir["roost-*"].first => "roost"
  end

  test do
    assert_match "roost", shell_output("#{bin}/roost --help")
  end
end
