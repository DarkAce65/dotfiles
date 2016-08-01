#!/bin/bash

font='Terminusmod:size=10'
dimensions=$(xrandr | grep '*' | awk {'print $1'})
screenheight=$(echo $dimensions | cut -d 'x' -f2)
screenwidth=$(echo $dimensions | cut -d 'x' -f1)
x=$(($screenwidth - 270))
y=55

status=$(playerctl status)
track=$(playerctl metadata title)
artist=$(playerctl metadata artist)
album=$(playerctl metadata album)

if [[ "${track}" = "" ]] || [[ "${artist}" = "" ]]; then
	exit
fi

play="^fn(FontAwesome:size=10)^fn()"
pause="^fn(FontAwesome:size=10)^fn()"
prev="^fn(FontAwesome:size=10)^fn()"
next="^fn(FontAwesome:size=10)^fn()"

(echo "Music";
echo "";
echo "  Track:  ^fg(#977d5e)$track^fg()";
echo "  Artist: ^fg(#977d5e)$artist^fg()";
echo "  Album:  ^fg(#977d5e)$album^fg()";
echo "  $percbar";
echo "^p(_CENTER)^ca(1, playerctl prev)"$prev"   ^ca()^ca(1, playerctl pause)"$pause"   ^ca()^ca(1, playerctl play)"$play"   ^ca()^ca(1, playerctl next)"$next"   ^ca()";
sleep 15) | dzen2 -fg "#dbb787" -bg "#2d2123" -fn $font -x $x -y $y -w 250 -l 7 -e 'onstart=uncollapse,hide;button3=exit' & 
