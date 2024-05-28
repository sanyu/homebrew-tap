class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.4/toggl-aarch64-apple-darwin-0.4.4.zip"
      sha256 "4fa8957edfe53365a2d338b2fb67a49ce2ec4f3218e6911feaa4c059da3a00a1"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.4/toggl-x86_64-apple-darwin-0.4.4.zip"
      sha256 "8d2b09aa37f5693730af075741ff2a3282b7fdd67a27eafd51992eb323c6c6e8"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
