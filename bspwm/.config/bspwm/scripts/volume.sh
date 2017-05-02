#!/bin/bash

step=${2-2}

case $1 in
	mute)
		mixerinfo=$(amixer sset Master toggle) ;; # mute/unmute
	up)
		mixerinfo=$(amixer sset Master ${step}%+ unmute) ;; # increase volume
	down)
		mixerinfo=$(amixer sset Master ${step}%- unmute) ;; # decrease volume
esac

if [[ -z $mixerinfo ]]; then
	mixerinfo=$(amixer get Master)
fi

volume=$(echo $mixerinfo | egrep -o "[0-9]+%" | head -1 | egrep -o "[0-9]*")
muted=$(echo $mixerinfo | egrep -o "\[[a-z]+\]" | head -1 | egrep -o "[a-z]*")

if [[ $muted == "off" ]]; then
	label='Mute'
	fg='#888888'
else
	label="$volume%"
	fg=$(crudini --get $HOME/.config/polybar/config 'colors' 'bar-foreground')
fi
label=$(printf '%4s' $label)

$HOME/.config/bspwm/scripts/progressbar.sh $volume "${label}" $fg
