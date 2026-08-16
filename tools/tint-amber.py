#!/usr/bin/env python3
"""Amber-tint the greyscale parts of an SVG.

Each grey is mapped to a Meridian-amber shade at the same lightness, so the
icon keeps its light/dark structure but reads amber. Saturated (brand) colours
and near-white highlights are left untouched, so mixed icons keep their accents.

    tint-amber.py FILE [FILE ...]
"""
import re
import sys

AMBER = (0xE8, 0x76, 0x0A)   # Meridian amber
DARK = (0x1A, 0x0D, 0x02)    # warm near-black for the shadow end
GREY_SPREAD = 16             # max channel spread still treated as "grey"
WHITE_KEEP = 240             # keep near-white highlights as-is


def _ramp(lightness):
    """Amber shade at a given 0-255 lightness: warm-dark -> amber -> white."""
    if lightness < 128:
        t = lightness / 128.0
        return tuple(round(DARK[i] + (AMBER[i] - DARK[i]) * t) for i in range(3))
    t = (lightness - 128) / 127.0
    return tuple(round(AMBER[i] + (255 - AMBER[i]) * t) for i in range(3))


def _convert(match):
    h = match.group(1)
    if len(h) == 3:
        r, g, b = (int(ch * 2, 16) for ch in h)
    else:
        r, g, b = (int(h[i:i + 2], 16) for i in (0, 2, 4))
    if max(r, g, b) - min(r, g, b) > GREY_SPREAD:
        return match.group(0)                       # brand colour - keep
    if r >= WHITE_KEEP and g >= WHITE_KEEP and b >= WHITE_KEEP:
        return match.group(0)                       # white highlight - keep
    lightness = round(0.299 * r + 0.587 * g + 0.114 * b)
    return "#%02x%02x%02x" % _ramp(lightness)


_HEX = re.compile(r"#([0-9a-fA-F]{6}|[0-9a-fA-F]{3})\b")


def main(paths):
    for path in paths:
        with open(path, encoding="utf-8") as fh:
            svg = fh.read()
        with open(path, "w", encoding="utf-8") as fh:
            fh.write(_HEX.sub(_convert, svg))


if __name__ == "__main__":
    main(sys.argv[1:])
