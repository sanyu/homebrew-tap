class Tg < Formula
  desc "Toggl CLI wrapper with clipboard support for macOS"
  homepage "https://github.com/sanyu/alfred-toggl"
  url "https://github.com/sanyu/alfred-toggl/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "cebadab1e4e5afe5802d33be133f54893c9bd96208b2b5139b2a75e92dd129a5"
  license "MIT"

  depends_on "sanyu/tap/toggl-cli"
  depends_on "todoist-cli"
  depends_on "jq"

  def install
    bin.install "tg"
  end

  test do
    assert_match "Error: No description provided and clipboard is empty",
                 shell_output("#{bin}/tg start 2>&1", 1)
  end
end
