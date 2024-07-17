#!/bin/bash

current=$(bspc query -N -n focused)
floating=$(bspc query -N -n .window.floating)

[ -z "$floating" ] && exit 0

if bspc query -N -n focused.floating; then
    bspc node -f last.tiled
else
    first_floating=$(echo "$floating" | head -n 1)
    bspc node -f "$first_floating"
fi
