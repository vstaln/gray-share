<p align="center">
  <img src="assets/gray-logo.svg" alt="gray" width="96">
</p>
<h1 align="center">gray-share</h1>
<p align="center">Export gray session transcripts as self-contained HTML.</p>
<p align="center">
  <a href="https://github.com/vstaln/gray-share/blob/main/LICENSE"><img alt="MIT License" src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
  <img alt="gray plugin" src="https://img.shields.io/badge/gray-plugin-7aa2f7.svg">
  <img alt="rust" src="https://img.shields.io/badge/built%20with-rust-orange.svg">
</p>

Write a session transcript to one dark, monospace HTML file: role-colored
`user`/`assistant`/`system` entries and collapsible tool-call details, with
no external assets or network dependencies.

## Usage

- `share` tool — `{session?, out?}`: `session` is a session id or unique
  prefix resolved against `~/.gray/sessions/<sid>*.jsonl` (default: the
  calling session, else the newest transcript). Writes
  `~/.gray/share/<sid>-<unix-ts>.html` (or `out`) and replies
  `wrote <path> (<kb> KB)`.
- `/share [sid]` — export from the TUI.
- `/share list` — list existing exports.

Transcripts are only read, never modified.

## Wire methods

`plugin/manifest`, `plugin/shutdown`, `tool/call` (`share`), and
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

---
Part of the [gray](https://github.com/vstaln/gray) plugin ecosystem —
the open-source AI agent harness. <https://gray.alignment.id>
