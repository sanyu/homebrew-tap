class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.9/toggl-aarch64-apple-darwin-0.4.9.zip"
      sha256 "9cf29cc8faad0e506449925b30af7e6e784e9e5eadd029783b155a6719c76046"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.9/toggl-x86_64-apple-darwin-0.4.9.zip"
      sha256 "4c2f1ab87ae65a96f961cf676f589dbec5b6826e6dbd4d68271d310c249a871c"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
