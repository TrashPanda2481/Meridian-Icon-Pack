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
app launcher looks up) and `preferences-system` (System Settings) are
amber-tinted from Breeze, same as the rest of `apps/`/`status/` — see
Fallback above. They live under `places/scalable/` because that's where
Breeze itself files `start-here-kde`; `debian/copyright` has the exact
attribution.

`compass` (the Compass app's own icon, a distinct thing from the system
launcher) and the now-unused `meridian-menu` under `apps/16`, `apps/22`,
`apps/128` predate this and came from
[Meridian OS](https://github.com/TrashPanda2481/Meridian-OS). `meridian-menu`
is dead now that the launcher resolves via `start-here-kde` instead; kept
for now rather than removed (see README status notes).
