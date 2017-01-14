#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

height="35"
width="200"
x=$((SCREENWIDTH / 2 - width / 2))
y=$((10 + height))

geometry="${width}x${height}+${x}-${y}"
bspc config bottom_padding $((20 + height - WINDOW_GAP))

while :; do
	echo "$(date "+%a %d %b %l:%M %p")"
	sleep 2
done | dzen2 -geometry $geometry -fn $FONT -fg $FG -bg $BG -e "button2=;" &

pid=$!
l=20
wid=$(xdo id -p $pid)
while [ -z "$wid" -a $l -gt 0 ] ; do
	sleep 0.05
	wid=$(xdo id -p $pid)
	l=$((l - 1))
done
[ -n "$wid" ] && xdo above -t "$(xdo id -n root)" "$wid"
