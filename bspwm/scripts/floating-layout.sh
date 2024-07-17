#!/usr/bin/env bash

layout=$1
focused=$(bspc query -N -n focused.floating)
window=$(xdotool getactivewindow)

[ -z "$focused" ] && exit 0
[ "$layout" -lt 1 ] || [ "$layout" -gt 4 ] && exit 0

set_coordinates () {
    x=$1
    y=$2
}

[ "$layout" -eq 1 ] && set_coordinates 30 30
[ "$layout" -eq 2 ] && set_coordinates 30 650
[ "$layout" -eq 3 ] && set_coordinates 1190 650
[ "$layout" -eq 4 ] && set_coordinates 1190 30

xdotool windowsize --sync "$window" 700 400
xdotool windowmove --sync "$window" "$x" "$y"
