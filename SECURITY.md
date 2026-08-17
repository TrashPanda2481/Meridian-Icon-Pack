# Security & provenance

The rule this project holds itself to: **infrastructure is first-party,
assets can be sourced.**

## Why two different bars

A script is code that runs. A borrowed install script, a vendored build
tool, a dependency pulled in without reading it — that's the actual supply
chain risk, the place something rogue could sit unnoticed and later do
something nobody agreed to.

An icon file is a static image. It can't execute anything. The worst case
for a bad SVG/PNG is that it renders wrong, or in the rare case exploits a
bug in whatever library parses it — a real but categorically smaller and
different risk than "code we didn't write is now running on our systems."

So the two get different rules.

## Infrastructure: first-party, always

Everything that runs — `install.sh`, `tools/*.sh`, `tools/*.py`, and
anything added later in this vein — is written for this repo, by someone
who read every line, not copied from another icon theme's boilerplate or
pulled in as a dependency. Before merging new or changed tooling:

- No network access (no `curl`/`wget`/`urllib`/`requests`, no phoning home).
- No dynamic execution of anything not already in the repo (no `eval`,
  no downloading-then-running, no fetching a script and piping to a shell).
- No dependencies beyond language stdlib and standard system tools, unless
  there's a real reason and it's named explicitly here.
- Small enough to read end-to-end. If a tool is growing past that, it's a
  sign to split it, not a sign to stop reading it.
- `rm -rf`/destructive operations guarded against empty/unset variables
  (`${var:?}`), scoped to a fixed, known destination.

## Assets: sourced, but credited and static

Icon art (SVG/PNG) may come from any license-compatible open source —
Breeze, Papirus, Kanada, Tabler, Material Symbols, hand-drawn, whatever
fits. Requirements:

- License compatible with this repo's GPL-3.0 (LGPL, MIT, Apache-2.0, and
  GPL itself are all fine; check anything else before pulling it in).
- Credited in `CREDITS.md` — source project, license, what was changed
  (recolored, redrawn, as-is).
- Static only. An icon file that embeds a script (some SVG profiles allow
  `<script>`) doesn't qualify as "just an asset" and gets the infrastructure
  bar instead — stripped or rejected, not merged as-is.

## Audit log

- **2026-08-17** — full read of every executable file in the repo
  (`install.sh`, `tools/apply-theme.sh`, `tools/tint-amber.py`,
  `tools/recolor-folders.sh`, `tools/amber-symbolic.sh`; 131 lines total,
  no CI/workflow files, no other executable surface). Clean: no network
  calls, no dynamic execution, no dependencies beyond Python stdlib and
  standard KDE/POSIX CLI tools (`gtk-update-icon-cache`, `kwriteconfig6`,
  `kreadconfig6`, `kbuildsycoca6`, `kquitapp6`/`kstart`), nothing
  obfuscated. Baseline this policy holds the project to going forward.
