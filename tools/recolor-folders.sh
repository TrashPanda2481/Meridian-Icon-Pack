#!/usr/bin/env bash
# Remap the Kanada red folder palette to Meridian amber, in place.
#
# Kanada's default/semantic folders are drawn from one red ramp:
#   #cc241b / #cb251b  folder face (light / dark gradient stop)
#   #5d0e0a            shadow / back panel
#   #310805            deep shadow
# White paper (#fff/#ffffff) and the grey detail (#666666) are left alone.
#
#   ./recolor-folders.sh path/to/folder-*.svg
#
set -euo pipefail

for f in "$@"; do
    [ -f "$f" ] || continue
    sed -i \
        -e 's/#cc241b/#f0850c/gI' \
        -e 's/#cb251b/#e8760a/gI' \
        -e 's/#5d0e0a/#6e3a05/gI' \
        -e 's/#310805/#331a02/gI' \
        "$f"
done
