# perform-remotely Homebrew tap

The background worker for perform-remotely, packaged for Homebrew. This repository holds only the
formula; the binaries are attached to its [releases](../../releases). The source lives elsewhere.

## Install

```sh
brew tap clericuzzi/perform-remotely
brew install perform-remotely
```

Then `perform-remotely login` (or `perform-remotely login --pair` on a machine that can't sign in
with Google). `perform-remotely help` lists every command.

## It runs in the background

Once you sign in, the worker runs in the background: `login` installs and starts a per-user
service (a LaunchAgent on macOS, a `systemd --user` unit on Linux) that starts at every login and
restarts if it fails.

- `perform-remotely status` says whether it runs, since when, and where its log is.
- `perform-remotely logs` shows its log (`logs -f` follows it). The log stays on your machine, in
  `~/perform-remotely/logs`, kept 14 days.
- `perform-remotely stop` turns it off, and it stays off until `perform-remotely start`.
- `perform-remotely run` runs it in a terminal instead (`-v` shows each step), once the background
  one is stopped.

## Update

```sh
brew update && brew upgrade perform-remotely
```

The background worker restarts into the new version on its own.

## Uninstall

Remove the background service first, then the formula:

```sh
perform-remotely stop --remove
brew uninstall perform-remotely
```

`perform-remotely logout` also removes the service.

## Notes

- The builds are **unsigned** for now (macOS and Linux, arm64 and x86_64). Homebrew installs them
  without macOS's quarantine, so they run as they are.
- `terminal-notifier` is installed with it on macOS, for clickable notifications.
- The worker uses your own `gh`, `glab`, `git` and coding agent (Claude Code or Cursor) when
  they're installed; none is required to install it. The background worker finds them on the
  `PATH` of the terminal you signed in from.
- On Linux, a user service stops when you log out unless lingering is on for your user
  (`loginctl enable-linger`); the worker doesn't turn it on.
