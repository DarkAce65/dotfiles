#!/bin/bash

step=${2:-2}

font='Terminusmod:size=10'
dimensions=$(xrandr | grep '*' | awk {'print $1'})
screenheight=$(echo $dimensions | cut -d 'x' -f2)
screenwidth=$(echo $dimensions | cut -d 'x' -f1)
x=$(($screenwidth / 2 - 100))
y=55

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

if [[ "$muted" == "off" ]]; then
	label="Mute"
	fg="#777777"
	bg="#333333"
else
	label="$volume%"
	fg="#fe8100"
	bg="#6c3900"
fi
label=$(printf "%4s" $label)

pipe="/tmp/dzen2-vol"

if [ ! -e "$pipe" ]; then
	mkfifo "$pipe"
	(dzen2 -tw "200" -h "30" -x "$x" -y "$y" -fn "$font" -fg "#fbfed3" -bg "#2d2123" < "$pipe"
		rm -f "$pipe") &
fi

(echo "$volume" | gdbar -l "$label " -fg "$fg" -bg "$bg" -w "140"; sleep 2) > "$pipe"
