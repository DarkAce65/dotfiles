#!/bin/bash

source $HOME/.config/lemonbar/config
x=$((width / 2 - 100))

geometry="200x34+${x}+10"

while :; do
	datetime=$(date '+%A %b %d %l:%M %p')
	echo "%{c}${datetime}"
	sleep 2
done | lemonbar -bd -n 'clock' -g $geometry -f $font -F $foreground -B $background
