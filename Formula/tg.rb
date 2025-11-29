class Tg < Formula
  desc "Toggl CLI wrapper with clipboard support for macOS"
  homepage "https://github.com/sanyu/alfred-toggl"
  url "https://github.com/sanyu/alfred-toggl/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "5ee26c249b73ec8fc0a413d7e318d4f75223f172465418321eb27c6b70c301e3"
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
