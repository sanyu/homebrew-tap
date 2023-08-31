class TogglCli < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.3.0/toggl-aarch64-apple-darwin-0.3.0.zip"
      sha256 "0f5fe92c441ff9102c227f5512adf9820981c70d70bc28e3d9f3c95b8b4e6135"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.3.0/toggl-x86_64-apple-darwin-0.3.0.zip"
      sha256 "a199845312d915a1159b9c480276527e2913b20984af55a7941c9cb69db11ba9"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
