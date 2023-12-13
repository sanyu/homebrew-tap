class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.1/toggl-aarch64-apple-darwin-0.4.1.zip"
      sha256 "11a87576a660bb0fd4d98da8fd31b4b19ca7dc056533df3e8510a6ec60c2a950"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.1/toggl-x86_64-apple-darwin-0.4.1.zip"
      sha256 "6b60819b217772b118b61924316683ca7cc59bcdebcd5c4e24436456ef97ada0"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
