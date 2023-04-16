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
