class Tg < Formula
  desc "Toggl CLI wrapper with clipboard support for macOS"
  homepage "https://github.com/sanyu/alfred-toggl"
  url "https://github.com/sanyu/alfred-toggl/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "d9c79fb65475aab3930109e7ff03f1b048ba1911504e895d7f9506049dba2e33"
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
