# gray-share

Export a gray session transcript to **one self-contained HTML file** —
dark theme, monospace, role-colored `user`/`assistant`/`system` entries,
tool calls shown with their name and collapsible `<details>` args/results.
No external assets, no network. Original work (no upstream plugin).

A sidecar plugin for [gray](https://github.com/vstaln/gray), scaffolded by
[gray-account](https://github.com/vstaln/gray-account).

## Usage

- `share` tool — `{session?, out?}`: `session` is a session id or unique
  prefix resolved against `~/.gray/sessions/<sid>*.jsonl` (default: the
  calling session, else the newest transcript). Writes
  `~/.gray/share/<sid>-<unix-ts>.html` (or `out`) and replies
  `wrote <path> (<kb> KB)`.
- `/share [sid]` — same export from the TUI.
- `/share list` — list existing exports.

Transcripts are only read, never modified.

## Wire methods

`plugin/manifest`, `plugin/shutdown`, `tool/call` (`share`),
`command/run` (`/share`). Protocol 1.1 — no hooks, no host capabilities.

## Install

```sh
gray plugin install share
```

## Develop

```sh
cargo test
gray account check      # entry point + manifest handshake
gray account publish    # check → build → release → publish to the gray registry
```

Bump `version` in `Cargo.toml` before each `publish`; the registry refuses to
republish a version.
