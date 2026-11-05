# Homebrew Tap

Personal Homebrew tap for sanyu's tools.

## Installation

Add this tap to your Brewfile:

```ruby
tap "sanyu/tap"
brew "sanyu/tap/toggl-cli"
brew "sanyu/tap/tg"
```

Then run:

```bash
brew bundle
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `toggl-cli` | Command line app for Toggl Track time tracking |
| `tg` | Toggl CLI wrapper with clipboard support for macOS |

## Bottles

A pull request that touches a formula builds it on macOS arm64 and Linux x86_64 (`brew test-bot`). Once the checks are green, run the `brew pr-pull` workflow with the pull request number: it uploads the bottles to a release of this repository, commits the bottle block and merges.

## Usage

```bash
# Start a timer
toggl start "Task description"

# Start a timer from clipboard
tg start

# Check current timer
toggl current

# Stop timer
toggl stop
```
