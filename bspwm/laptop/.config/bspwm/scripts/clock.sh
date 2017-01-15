#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

height="35"
width="200"
x=$((SCREENWIDTH / 2 - width / 2))
y=10

geometry="${width}x${height}+${x}+${y}"
bspc config bottom_padding $((20 + height - WINDOW_GAP))

while :; do
	echo "%{c}$(date "+%a %d %b %l:%M %p")"
	sleep 2
done | lemonbar -d -n "clock" -b -g $geometry -f $FONT -f $FONT_ICON -F $FG -B $BG &

l=20
wid=$(xdo id -a "clock")
while [ -z "$wid" -a $l -gt 0 ] ; do
	sleep 0.05
	wid=$(xdo id -a "clock")
	l=$((l - 1))
done
[ -n "$wid" ] && xdo above -t "$(xdo id -n root)" "$wid"
