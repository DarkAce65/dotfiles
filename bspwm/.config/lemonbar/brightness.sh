#!/bin/bash

source $HOME/.config/lemonbar/config
x=$((width - 220))
geometry="200x17+${x}+10"

while :; do
	brightness=$(xbacklight -get)
	bar=$($HOME/.config/lemonbar/bar.sh $brightness)
	echo "%{r}${brightness}% %{T3}${bar}%{T-}"
	sleep 2
done | lemonbar -bd -n brightness -g $geometry -f "${smallfont}" -f "${iconfont}:pixelsize=16" -f "${barfont}" -F $foreground -B $background
