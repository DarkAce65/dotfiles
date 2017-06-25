#!/bin/bash

source $HOME/.config/lemonbar/config
x=$((width - 220))
geometry="200x17+${x}+10"

while :; do
	volume=$(xbacklight -get)
	echo "%{r}${volume}% bar"
	sleep 2
done | lemonbar -bd -n 'brightness' -g $geometry -f $font -f $iconfont':pixelsize=16' -F $foreground -B $background
