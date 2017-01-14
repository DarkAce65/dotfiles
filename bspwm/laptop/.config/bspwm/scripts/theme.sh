#!/bin/bash

if [[ ! -e /tmp/theme ]]; then
	echo "0" > /tmp/theme
fi

if [[ $# -eq 0 ]]; then
	theme=$(cat /tmp/theme)
else
	while [[ $# -gt 0 ]]; do
		case "$1" in
			-i|--inc)
				shift
				theme=$(($(cat /tmp/theme) + 1))
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

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ $theme -gt 1 ]]; then
	theme=0
fi

echo $theme > /tmp/theme
case $theme in
	0)
		cp $DIR/themes/.Xresources.cool ~/.Xresources
		feh --bg-fill /usr/share/backgrounds/skyline.png
		border="#27aac4"
		;;
	1)
		cp $DIR/themes/.Xresources.warm ~/.Xresources
		feh --bg-fill /usr/share/backgrounds/landscape.jpg
		border="#fd7e49"
		;;
esac

bspc config normal_border_color   "#444444"
bspc config focused_border_color  $border
bspc config presel_feedback_color $border

pkill dzen2
pkill clock.sh
pkill workspaces.sh
$DIR/clock.sh
$DIR/workspaces.sh
xrdb ~/.Xresources
