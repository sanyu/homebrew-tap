class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.5/toggl-aarch64-apple-darwin-0.4.5.zip"
      sha256 "7a2b949e41910cb59e8fd29fb5122608b17e7c9c0965d9e3f2e8c0017f4276a9"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.5/toggl-x86_64-apple-darwin-0.4.5.zip"
      sha256 "9f79297132cecc15d41a4062e9e0f3aa99693da921c3d133c7f47412c2b15743"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
