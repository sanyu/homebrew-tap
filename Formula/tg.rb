class Tg < Formula
  desc "Toggl CLI wrapper with clipboard support for macOS"
  homepage "https://github.com/sanyu/alfred-toggl"
  url "https://github.com/sanyu/alfred-toggl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2401526e31a5b533e869f705c90cfb21118975644f1986c09cb69969b862062c"
  license "MIT"

  depends_on "sanyu/tap/toggl-cli"

  def install
    bin.install "tg"
  end

  test do
    assert_match "Error: No description provided and clipboard is empty",
                 shell_output("#{bin}/tg start 2>&1", 1)
  end
end
