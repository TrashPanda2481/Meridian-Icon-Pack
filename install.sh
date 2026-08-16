#!/usr/bin/env bash
# Install the Meridian icon theme.
#
#   ./install.sh          install for the current user (~/.local/share/icons)
#   sudo ./install.sh -s  install system-wide (/usr/share/icons)
#
set -euo pipefail

theme="Meridian"
here="$(cd "$(dirname "$0")" && pwd)"
src="$here/$theme"

if [ ! -f "$src/index.theme" ]; then
    echo "error: $src/index.theme not found - run this from the repo." >&2
    exit 1
fi

dest="$HOME/.local/share/icons"
case "${1:-}" in
    -s|--system) dest="/usr/share/icons" ;;
    "") ;;
    *) echo "usage: $0 [-s|--system]" >&2; exit 1 ;;
esac

mkdir -p "$dest"
rm -rf "${dest:?}/$theme"
cp -r "$src" "$dest/$theme"

if command -v gtk-update-icon-cache >/dev/null 2>&1; then
    gtk-update-icon-cache -f "$dest/$theme" >/dev/null 2>&1 || true
fi

echo "installed $theme -> $dest/$theme"
echo
echo "set it as the active theme:"
echo "  System Settings > Appearance > Icons > Meridian"
echo "or from the terminal:"
echo "  kwriteconfig6 --file kdeglobals --group Icons --key Theme $theme"
