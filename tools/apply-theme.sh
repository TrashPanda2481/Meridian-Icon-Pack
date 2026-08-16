#!/usr/bin/env bash
# Install the Meridian icon theme, clear KDE's stale icon caches, and reload
# Dolphin so folder icons refresh. Run after a `git pull`:
#
#   bash tools/apply-theme.sh
#
set -uo pipefail

here="$(cd "$(dirname "$0")/.." && pwd)"

echo "== installing theme =="
bash "$here/install.sh"

echo "== setting Meridian as the active icon theme =="
kwriteconfig6 --file kdeglobals --group Icons --key Theme Meridian

echo "== clearing stale icon caches (the usual reason folders stay blue) =="
rm -f "$HOME/.cache/icon-cache.kcache"
rm -f "$HOME/.local/share/icons/Meridian/icon-theme.cache"
kbuildsycoca6 >/dev/null 2>&1 || true

echo "== reloading Dolphin =="
kquitapp6 dolphin >/dev/null 2>&1 || true
sleep 1
(kstart dolphin >/dev/null 2>&1 &) || (setsid dolphin >/dev/null 2>&1 &) || true

echo
echo "---- state ----"
printf 'active icon theme: '
kreadconfig6 --file kdeglobals --group Icons --key Theme
if [ -f "$HOME/.local/share/icons/Meridian/places/scalable/folder.svg" ]; then
    echo "folder.svg: installed"
else
    echo "folder.svg: MISSING - install did not copy the folders"
fi
echo
echo "Open Dolphin at / to check. If folders are still blue, log out and back"
echo "in once - that fully clears the in-memory icon cache."
