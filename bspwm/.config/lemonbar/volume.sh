#!/bin/bash

source $HOME/.config/lemonbar/config
x=$((width - 220))
geometry="200x17+${x}+27"

while :; do
	volume=$(amixer get Master | egrep -o "[0-9]+%" | head -1 | egrep -o "[0-9]*")
	echo "%{r}${volume}% bar"
	sleep 2
done | lemonbar -bd -n 'volume' -g $geometry -f $font -f $iconfont':pixelsize=16' -F $foreground -B $background
