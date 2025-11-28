class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.11/toggl-aarch64-apple-darwin-0.4.1.zip"
      sha256 "b88b359f51c91e15b40fd140b9fcde45da14736a8e5f18438af08b98775f3732"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.11/toggl-x86_64-apple-darwin-0.4.1.zip"
      sha256 "661dab1a35d52d3ffe0e5586f1a62ebcc2b3827df43e032bf45b6ae8e4c1f4d9"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
