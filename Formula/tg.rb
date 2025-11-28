class Tg < Formula
  desc "Toggl CLI wrapper with clipboard support for macOS"
  homepage "https://github.com/sanyu/alfred-toggl"
  url "https://github.com/sanyu/alfred-toggl/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "9d58a811abc5d6e8d4f2ff8190c50a486b5edf05b62db24ec98fde5839aa3978"
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
