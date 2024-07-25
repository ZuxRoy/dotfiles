#!/usr/bin/env bash

focused=$(bspc query -N -n focused.floating)
window=$(xdotool getactivewindow)

[ -z "$focused" ] && exit 0

xdotool windowsize --sync "$window" 1400 800
xdotool windowmove --sync "$window"  260 140
