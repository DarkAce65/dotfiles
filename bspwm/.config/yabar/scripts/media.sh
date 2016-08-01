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
	(echo "";
	echo "Media player not found.";
	echo "";
	sleep 2) | dzen2 -fg "#dbb787" -bg "#2d2123" -fn $font -x $x -y $y -w 300 -sa c -l 2 -e 'onstart=uncollapse;button3=exit' &
	exit
fi

playpause="^ca(1, playerctl play-pause; $(dirname $0)/media.sh)^fn(FontAwesome:size=9)"
if [[ "${status}" = "Playing" ]]; then
	playpause+="^fn()^ca()"
else
	playpause+="^fn()^ca()"
fi
prev="^ca(1, playerctl previous; $(dirname $0)/media.sh)^fn(FontAwesome:size=9)^fn()^ca()"
next="^ca(1, playerctl next; $(dirname $0)/media.sh)^fn(FontAwesome:size=9)^fn()^ca()"

(echo "";
echo "  Track:   ^fg(#977d5e)$track^fg()";
echo "  Artist:  ^fg(#977d5e)$artist^fg()";
echo "  Album:   ^fg(#977d5e)$album^fg()";
echo "";
echo "                     "$prev"  "$playpause"  "$next;
sleep 15) | dzen2 -fg "#dbb787" -bg "#2d2123" -fn $font -x $x -y $y -w 300 -l 6 -ta c -e 'onstart=uncollapse;button3=exit' &
