class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.7/toggl-aarch64-apple-darwin-0.4.7.zip"
      sha256 "513361a5ab1b3476275252530227c290878d7c7cdebd2e78b8d0d3e5dcdd77cb"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.7/toggl-x86_64-apple-darwin-0.4.7.zip"
      sha256 "079f69ab6ebccd688f00f5532c288704d7f69417459983876122df6b916cf54e"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
