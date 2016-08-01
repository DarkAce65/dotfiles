#!/bin/bash

font='Terminusmod:size=10'
dimensions=$(xrandr | grep '*' | awk {'print $1'})
screenheight=$(echo $dimensions | cut -d 'x' -f2)
screenwidth=$(echo $dimensions | cut -d 'x' -f1)
x=$(($screenwidth - 320))
y=55

status=$(playerctl status)
track=$(playerctl metadata title)
artist=$(playerctl metadata artist)
album=$(playerctl metadata album)

if [[ "${track}" = "" ]] || [[ "${artist}" = "" ]]; then
	exit
fi

pkill -x dzen2

play="^ca(1, playerctl play; $(dirname $0)/media.sh)^fn(FontAwesome:size=9)^fn()^ca()"
pause="^ca(1, playerctl pause; $(dirname $0)/media.sh)^fn(FontAwesome:size=9)^fn()^ca()"
prev="^ca(1, playerctl previous; $(dirname $0)/media.sh)^fn(FontAwesome:size=9)^fn()^ca()"
next="^ca(1, playerctl next; $(dirname $0)/media.sh)^fn(FontAwesome:size=9)^fn()^ca()"

(echo "";
echo "  Track:   ^fg(#977d5e)$track^fg()";
echo "  Artist:  ^fg(#977d5e)$artist^fg()";
echo "  Album:   ^fg(#977d5e)$album^fg()";
echo "";
echo "                     "$prev"  "$pause"  "$play"  "$next;
sleep 20) | dzen2 -fg "#dbb787" -bg "#2d2123" -fn $font -x $x -y $y -w 300 -l 6 -ta c -e 'onstart=uncollapse;button3=exit' & 
