# perform-remotely Homebrew tap

The background worker for perform-remotely, packaged for Homebrew. This repository holds only the
formula; the binaries are attached to its [releases](../../releases). The source lives elsewhere.

## Install

```sh
brew tap clericuzzi/perform-remotely
brew install perform-remotely
```

Then `perform-remotely login` (or `perform-remotely login --pair` on a machine that can't sign in
with Google) and `perform-remotely run`. `perform-remotely help` lists every command.

## Update

```sh
brew update && brew upgrade perform-remotely
```

## Notes

- The builds are **unsigned** for now (macOS and Linux, arm64 and x86_64). Homebrew installs them
  without macOS's quarantine, so they run as they are.
- `terminal-notifier` is installed with it on macOS, for clickable notifications.
- The worker uses your own `gh`, `glab`, `git` and coding agent (Claude Code or Cursor) when
  they're installed; none is required to install it.
