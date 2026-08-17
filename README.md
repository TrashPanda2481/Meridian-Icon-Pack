# Meridian Icon Pack

Icon theme in [Meridian OS](https://github.com/TrashPanda2481/Meridian-OS)'s
amber-on-charcoal style. Packaged as a standard `.deb` — installs on any
Debian system running a desktop that reads the freedesktop icon theme spec,
not just Meridian OS.

It's an overlay, not a full set. It replaces a curated, growing group of
icons — the app launcher, apps, folders, tray/status glyphs — with ones that
fit Meridian's amber-on-charcoal look, and inherits `Papirus-Dark` (if
installed) then `Breeze` for everything it doesn't override. Nothing renders
blank while the set fills out.

## Install

**From a `.deb`** (recommended — download the latest from
[Releases](https://github.com/TrashPanda2481/Meridian-Icon-Pack/releases)):

```
sudo apt install ./meridian-icon-pack_*.deb
```

`apt` (not bare `dpkg -i`) resolves `Recommends:` (Breeze, Papirus-Dark) for
you. Icon-cache refresh is handled automatically by debhelper's triggers —
no manual step needed.

**Building the `.deb` yourself**, on a Debian system:

```
git clone https://github.com/TrashPanda2481/Meridian-Icon-Pack.git
cd Meridian-Icon-Pack
sudo apt install devscripts debhelper
dpkg-buildpackage -us -uc -b
sudo apt install ../meridian-icon-pack_*.deb
```

**From source, without packaging** (dev/testing convenience only — the
`.deb` above is the real distribution path):

```
./install.sh            # current user, no root (~/.local/share/icons)
sudo ./install.sh -s    # system-wide (/usr/share/icons)
```

Either way, pick the theme in **System Settings → Appearance → Icons**, or:

```
kwriteconfig6 --file kdeglobals --group Icons --key Theme Meridian
```

Log out and back in (or `plasmashell --replace &`) for everything to pick it up.

## Requirements

Breeze icons need to be present — they are on any KDE Plasma install. This
theme falls through to Breeze for anything it doesn't override.

`Papirus-Dark` (`papirus-icon-theme`) is optional but preferred: if it's
installed, uncovered icons resolve there before falling through to Breeze.
Without it, everything not themed here just goes straight to Breeze.

## Layout

```
Meridian/
  index.theme          metadata + inheritance
  apps/<size>/         fixed-size application icons (PNG)
  apps/scalable/       SVG application icons
  places/scalable/     folders and places
  status/scalable/     panel/tray symbolic icons (battery, audio, auth, ...)
  mimetypes/scalable/  file-type icons
```

Add or replace an icon by dropping it in the matching context directory under
its freedesktop name — `apps/scalable/firefox.svg`, `places/scalable/folder.svg`
— then rerun `install.sh`. SVG is preferred; PNG is fine for fixed sizes. If you
add a new size directory, list it under `Directories=` in `index.theme`.

## Status

Past early. Currently in the set:

- **Places** — the full Kanada-derived folder set (67 icons), recolored to
  the amber palette.
- **Apps** — 138 scalable app icons, amber-tinted from their greyscale KDE
  originals, plus a few fixed-size icons for cases that need them.
- **Status/tray** — a full symbolic set (battery states, audio, auth, etc.)
  amber-tinted for the panel and system tray.
- **Launcher** — `start-here-kde`/`start-here-kde-symbolic` (the actual
  freedesktop names Kickoff looks up), amber-tinted, plus the Compass app's
  own icon.
- **System Settings** — `preferences-system`, amber-tinted (the app's real
  icon name; a differently-named `systemsettings.svg` was tinted earlier by
  mistake and didn't actually get used anywhere).

Anything outside those categories still falls through to Papirus-Dark or
Breeze.

## Security & provenance

Tooling (`install.sh`, `tools/`) is first-party and reviewed — no borrowed
scripts, no network calls, no undeclared dependencies. Icon assets may be
sourced from any license-compatible open project, credited in
[`CREDITS.md`](CREDITS.md). See [`SECURITY.md`](SECURITY.md) for the full
policy and audit log.

## License

GPL-3.0. See [LICENSE](LICENSE).
