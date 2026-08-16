# Meridian Icon Pack

Icon theme for [Meridian OS](https://github.com/TrashPanda2481/Meridian-OS).

It's an overlay, not a full set. It inherits Breeze and replaces a curated
group of icons — the app launcher, core apps, folders — with ones that fit
Meridian's amber-on-charcoal look. Anything not themed here falls through to
Breeze, so nothing renders blank while the set fills out.

## Install

```
git clone https://github.com/TrashPanda2481/Meridian-Icon-Pack.git
cd Meridian-Icon-Pack
./install.sh            # current user, no root (~/.local/share/icons)
sudo ./install.sh -s    # system-wide (/usr/share/icons)
```

Then pick it in **System Settings → Appearance → Icons**, or:

```
kwriteconfig6 --file kdeglobals --group Icons --key Theme Meridian
```

Log out and back in (or `plasmashell --replace &`) for everything to pick it up.

## Requirements

Breeze icons need to be present — they are on any KDE Plasma install. The theme
inherits them for every icon it doesn't override.

## Layout

```
Meridian/
  index.theme        metadata + inheritance
  apps/<size>/       fixed-size application icons (PNG)
  apps/scalable/     SVG application icons
  places/scalable/   folders and places
```

Add or replace an icon by dropping it in the matching context directory under
its freedesktop name — `apps/scalable/firefox.svg`, `places/scalable/folder.svg`
— then rerun `install.sh`. SVG is preferred; PNG is fine for fixed sizes. If you
add a new size directory, list it under `Directories=` in `index.theme`.

## Status

Early. The launcher (compass rose) and the Compass app icon are in; the rest is
Breeze fallback for now while the folder and app set gets drawn.

## License

GPL-3.0. See [LICENSE](LICENSE).
