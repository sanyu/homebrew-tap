class Tg < Formula
  desc "Toggl CLI wrapper with clipboard support for macOS"
  homepage "https://github.com/sanyu/alfred-toggl"
  url "https://github.com/sanyu/alfred-toggl/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "05577bc5399613a1a3a79fc989a9ac57933ba502b08619222c0aa8bf420afd2e"
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
