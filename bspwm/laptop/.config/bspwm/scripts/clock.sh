#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

height="35"
width="200"
x=$((SCREENWIDTH / 2 - width / 2))
y="10"

geometry="${width}x${height}+${x}+${y}"
bspc config bottom_padding $((y * 2 + height - WINDOW_GAP))

while :; do
	datetime=$(date "+%a %b %d %l:%M %p")
	echo "%{c}${datetime}"
	sleep 2
done | lemonbar -d -n "clock" -b -g $geometry -f $FONT -f $FONT_ICON -F $FG -B $BG &
