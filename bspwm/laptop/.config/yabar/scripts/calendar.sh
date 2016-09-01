#!/bin/bash

font='Terminusmod:size=10'
source ~/.config/dimensions
x=$(($screenwidth - 230))
y=55

lines=$(cal -m | wc -l)

pipe="/tmp/dzen2-cal"

if [ ! -e "$pipe" ]; then
	mkfifo "$pipe"
	(dzen2 -fg "#977d5e" -bg "#111111" -fn $font -x $x -y $y -w 170 -l $lines -ta c -sa c -e 'onstart=uncollapse;button3=exit' < "$pipe"
		rm -f "$pipe") &
fi

today=$(date "+%d" | sed "s/^0/ /")
(echo ""; cal | sed -r -e "/[a-z]+/ s/^/\^fg(#fe8100)/" -e "/[a-z]+/ s/$/\^fg()/" -e "s/(^| )($today)($| )/\1\^fg(#111111)\^bg(#dbb787)\2\^bg()\^fg()\3/"; sleep 10) > "$pipe"
