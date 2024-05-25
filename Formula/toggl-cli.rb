class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.3/toggl-aarch64-apple-darwin-0.4.3.zip"
      sha256 "340e4521842b39181dd795885f0dd27f225793d2b1e81babdd219e0375383b83"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.3/toggl-x86_64-apple-darwin-0.4.3.zip"
      sha256 "5ac534ac8b361907da63a29734bea0a901b3f492be0ee993e6ad5ee7aad3677e"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
