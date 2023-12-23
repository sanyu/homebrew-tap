class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.2/toggl-aarch64-apple-darwin-0.4.2.zip"
      sha256 "1e5246182a97e071263cf1ea1d12582b3e659d81f4a667961592177ba350817c"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.4.2/toggl-x86_64-apple-darwin-0.4.2.zip"
      sha256 "e25141d813af22d2791905dfd32366d50cacdb3bceefaf37e247c329ed5f2307"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
