#!/bin/bash

source $HOME/.config/lemonbar/config
x=$((width - 220))
geometry="200x17+${x}+27"

while :; do
	mixerinfo=$(amixer get Master)
	volume=$(echo $mixerinfo | egrep -o "[0-9]+%" | head -1 | egrep -o "[0-9]*")
	muted=$(echo $mixerinfo | egrep -o "\[[a-z]+\]" | head -1 | egrep -o "[a-z]*")
	bar=$($HOME/.config/lemonbar/bar.sh $volume)
	if [[ $muted == 'off' ]]; then
		echo "%{r}Mute %{T3}${bar}%{T-}"
	else
		echo "%{r}${volume}% %{T3}${bar}%{T-}"
	fi
	sleep 2
done | lemonbar -bd -n volume -g $geometry -o -1 -f "${smallfont}" -f "${iconfont}:pixelsize=16" -f "${barfont}" -F $foreground -B $background
