#!/bin/bash

source $HOME/.config/lemonbar/config
x=$((width / 2 + 110))

geometry="65x34+${x}+10"

while :; do
	charge=$(acpi --battery | cut -d, -f2 | tr -d '[:space:]%')
	icon=""
	if [[ $charge -lt 20 ]]; then
		icon=""
	elif [[ $charge -lt 50 ]]; then
		icon=""
	fi
	if [[ $(cat /sys/class/power_supply/ADP1/online) -eq 1 ]]; then
		icon=""
	fi
	echo "%{c}${icon}${charge}%"
	sleep 15
done | lemonbar -bd -n battery -g $geometry -f "${font}" -f "${iconfont}:pixelsize=14" -F $foreground -B $background
