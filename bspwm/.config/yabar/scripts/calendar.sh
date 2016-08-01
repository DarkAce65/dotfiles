#!/bin/bash

font='Terminusmod:size=10'
dimensions=$(xrandr | grep '*' | awk {'print $1'})
screenheight=$(echo $dimensions | cut -d 'x' -f2)
screenwidth=$(echo $dimensions | cut -d 'x' -f1)
x=$(($screenwidth - 230))
y=55

lines=$(cal -m | wc -l)

(echo "";
cal;
sleep 5
) | dzen2 -fg "#dbb787" -bg "#2d2123" -fn $font -x $x -y $y -w 170 -l $lines -ta c -sa c -e 'onstart=uncollapse;button3=exit' &
