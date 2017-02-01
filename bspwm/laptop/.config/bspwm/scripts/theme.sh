#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
tfile=$DIR"/themes/theme"
if [[ ! -e $tfile ]]; then
	echo "0" > $tfile
fi

if [[ $# -eq 0 ]]; then
	theme=$(cat $tfile)
else
	while [[ $# -gt 0 ]]; do
		case "$1" in
			-i|--inc)
				shift
				theme=$(($(cat $tfile) + 1))
				;;
			-s|--set)
				shift
				if [[ $# -gt 0 ]]; then
					theme=$1
				else
					echo "No theme specified."
					exit 1
				fi
				shift
				;;
			*)
				break
				;;
		esac
	done
fi

if [[ $theme -gt 2 ]]; then
	theme=0
fi

echo $theme > $tfile
case $theme in
	0)
		cp $DIR/themes/.Xresources.cool ~/.Xresources
		feh --bg-fill /usr/share/backgrounds/skyline.png
		border="#3ea290"
		;;
	1)
		cp $DIR/themes/.Xresources.warm ~/.Xresources
		feh --bg-fill /usr/share/backgrounds/landscape.jpg
		border="#fd7e49"
		;;
	2)
		cp $DIR/themes/.Xresources.mono ~/.Xresources
		feh --bg-fill /usr/share/backgrounds/mono.png
		border="#aaaaaa"
		;;
esac

bspc config normal_border_color   "#444444"
bspc config focused_border_color  $border
bspc config presel_feedback_color $border

pkill clock.sh
pkill workspaces.sh
pkill lemonbar
pkill dzen2
$DIR/clock.sh &
$DIR/battery.sh &
$DIR/workspaces.sh &
xrdb ~/.Xresources
sleep 0.5
xdo below -t $(xdo id -n root) $(xdo id -a clock)
xdo below -t $(xdo id -n root) $(xdo id -a battery)
xdo below -t $(xdo id -n root) $(xdo id -a workspaces)
