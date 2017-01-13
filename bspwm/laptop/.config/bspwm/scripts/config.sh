#!/bin/bash

dimensions=$(xrandr | grep '*' | awk {'print $1'})
SCREENHEIGHT=$(echo $dimensions | cut -d 'x' -f2)
SCREENWIDTH=$(echo $dimensions | cut -d 'x' -f1)

WINDOW_GAP="20"
FONT='IosevkaTerm:size=9:style=Bold'
FONT_ICON='WunconSiji:size=8'

if [[ ! -e /tmp/theme ]]; then
	DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	cp $DIR/themes/.Xresources.cool ~/.Xresources
	xrdb ~/.Xresources
	echo 0 > /tmp/theme
fi
theme=$(cat /tmp/theme)

if [[ $theme -eq 0 ]]; then
	FG="#090d18"
	FG_ACCENT="#3B5BB2"
	BG="#a3cadc"
	VOL_FG="#c423ff"
	BRT_FG="#1b95ad"
	BAR_BG="#000918"
elif [[ $theme -eq 1 ]]; then
	FG="#090d18"
	FG_ACCENT="#3B5BB2"
	BG="#a3cadc"
	VOL_FG="#c423ff"
	BRT_FG="#1b95ad"
	BAR_BG="#000918"
fi