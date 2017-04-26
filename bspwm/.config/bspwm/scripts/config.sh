#!/bin/bash

dimensions=$(xrandr | grep '*' | awk {'print $1'})
SCREENHEIGHT=$(echo $dimensions | cut -d 'x' -f2)
SCREENWIDTH=$(echo $dimensions | cut -d 'x' -f1)

BORDER_WIDTH=3
WINDOW_GAP=-$BORDER_WIDTH
MARGIN=20
BAR_HEIGHT=35
FONT='IosevkaTerm:size=9:style=Bold'
FONT_ICON='WunconSiji:size=8'

tfile="/tmp/theme"
if [[ ! -e $tfile ]]; then
	theme=0
else
	theme=$(cat $tfile)
fi

if [[ $theme -eq 0 ]]; then
	FG='#0e0e31'
	FG_ACCENT='#4d4dc4'
	BG='#b0b0eb'
	BAR_FG='#1b95ad'
	BAR_BG='#0e0e31'
elif [[ $theme -eq 1 ]]; then
	FG='#2e102c'
	FG_ACCENT='#fd7e49'
	BG='#fedac4'
	BAR_FG='#d15e34'
	BAR_BG='#2e102c'
elif [[ $theme -eq 2 ]]; then
	FG='#777777'
	FG_ACCENT='#ffffff'
	BG='#141414'
	BAR_FG='#aaaaaa'
	BAR_BG='#444444'
fi