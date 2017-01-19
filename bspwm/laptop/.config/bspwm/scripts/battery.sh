#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

height="35"
width="65"
x=$((SCREENWIDTH / 2 + 110))
y="10"

geometry="${width}x${height}+${x}+${y}"

while :; do
	charge=$(acpi --battery | cut -d, -f2 | tr -d '[:space:]%')
	icon="\ue238"
	if [[ $charge -lt 15 ]]; then
		icon="\ue236"
	elif [[ $charge -lt 40 ]]; then
		icon="\ue237"
	fi
	echo "%{c}$(printf '%b' $icon) ${charge}%"
	sleep 10
done | lemonbar -d -n "battery" -b -g $geometry -f $FONT -f $FONT_ICON -F $FG -B $BG &
