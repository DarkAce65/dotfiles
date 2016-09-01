#!/bin/bash

font='Terminusmod:size=10'
source ~/.config/bspwm/scripts/.dimensions
x=$(($screenwidth - 230))
y=55

lines=$(cal -m | wc -l)

pipe="/tmp/dzen2-cal"

if [ ! -e "$pipe" ]; then
	mkfifo "$pipe"
	(dzen2 -fg "#888888" -bg "#111111" -fn $font -x $x -y $y -w 170 -l $lines -ta c -sa c -e 'onstart=uncollapse;button3=exit' < "$pipe"
		rm -f "$pipe") &
fi

today=$(date "+%d" | sed "s/^0/ /")
(echo ""; cal | sed -r -e "/[a-z]+/ s/^/\^fg(#55d0e0)/" -e "/[a-z]+/ s/$/\^fg()/" -e "s/(^| )($today)($| )/\1\^fg(#111111)\^bg(#37aaba)\2\^bg()\^fg()\3/"; sleep 10) > "$pipe"
