#!/usr/bin/env bash
# Force symbolic (color-scheme-following) icons to a flat Meridian amber.
#
# Panel/tray icons in Plasma use class="ColorScheme-Text" + fill:currentColor,
# so KDE recolors them to the scheme's text colour at render time. Replacing
# currentColor (and Breeze's mono fallback #cacaca) with a hardcoded amber
# defeats that substitution, so they render amber in the tray. Genuine
# semantic colours (e.g. a red battery-caution) are left untouched.
#
#   ./amber-symbolic.sh path/to/*.svg
#
set -euo pipefail

for f in "$@"; do
    [ -f "$f" ] || continue
    sed -i 's/currentColor/#e8760a/gI; s/#cacaca/#e8760a/gI' "$f"
done
