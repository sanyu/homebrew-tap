class Toggl < Formula
  desc "Command line app for Toggl Track time tracking"
  homepage "https://github.com/watercooler-labs/toggl-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.1.1/toggl-aarch64-apple-darwin-0.1.1.zip"
      sha256 "df23a6be4c23c92be9571add101caa1ac1b4c635ead2e51f230c23cb57d6663a"
    end
    on_intel do
      url "https://github.com/watercooler-labs/toggl-cli/releases/download/v0.1.1/toggl-x86_64-apple-darwin-0.1.1.zip"
      sha256 "a0c551cd14b851452e577cd278f943813fbbd4859575f3d6255e4da9ab96bf0a"
    end
  end

  def install
    bin.install "toggl"
  end

  test do
    assert_match "toggl", shell_output("#{bin}/toggl --help")
  end
end
