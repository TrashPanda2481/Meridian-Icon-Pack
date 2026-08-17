# Credits

This theme builds on the work of others. Thanks to everyone below.

## Folders and base icons

The folder set and much of the base iconography are adapted from **Kanada**
by **nesuko82** — https://github.com/nesuko82/kde-kanada — used under the MIT
License (Copyright (c) 2020 nesuko82). Folders have been recolored to
Meridian's amber palette; see `tools/recolor-folders.sh`. Kanada is itself
based on the Breeze icon set.

## Fallback

Anything this theme doesn't ship inherits from **Breeze** (KDE), used under the
LGPL-3.0.

## Launcher and settings

`start-here-kde`/`start-here-kde-symbolic` (the actual freedesktop names the
app launcher looks up) reuse `compass` — the Compass app's own icon, from
[Meridian OS](https://github.com/TrashPanda2481/Meridian-OS) — as a deliberate
branding choice, not Breeze-derived. `debian/copyright` has the exact
attribution (excluded from the Breeze/LGPL stanza on purpose).

`preferences-system`/`systemsettings` (System Settings) use a plain
`currentColor`-based compass glyph, amber-tinted from Breeze's own
`actions/compass.svg` convention, same reasoning as `tools/amber-symbolic.sh`
— also a deliberate choice to reuse the compass motif here rather than a
settings-gear icon.

The now-unused `meridian-menu` under `apps/16`, `apps/22`, `apps/128` predates
both of these and came from Meridian OS the same way `compass` did; kept for
now rather than removed (see README status notes).
