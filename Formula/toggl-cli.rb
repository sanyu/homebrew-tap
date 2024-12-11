class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.8/toggl-aarch64-apple-darwin-0.4.8.zip"
      sha256 "19e6096292396d256cce2f00ad8de581f0759b1ac3d3f31220ac417ce8abe0f9"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.8/toggl-x86_64-apple-darwin-0.4.8.zip"
      sha256 "08c63c6c82be17e166f007316d71f590f1f5e45adf3c7d5cfa234d447acd9775"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
