class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.2.0/toggl-aarch64-apple-darwin-0.2.0.zip"
      sha256 "558e8d4f6e0802384131738c7c1c628a25b724ae0c01ad2f47fb1df8bcea1be9"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.2.0/toggl-x86_64-apple-darwin-0.2.0.zip"
      sha256 "2f0cfaca5a6a784041c12b761996ac3e5b77761571918f27d6f785e60ed9881f"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
