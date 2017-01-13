#!/bin/bash

dimensions=$(xrandr | grep '*' | awk {'print $1'})
SCREENHEIGHT=$(echo $dimensions | cut -d 'x' -f2)
SCREENWIDTH=$(echo $dimensions | cut -d 'x' -f1)

WINDOW_GAP="20"
FONT='IosevkaTerm:size=9:style=Bold'
FONT_ICON='WunconSiji:size=8'

FG="#090d18"
FG_ACCENT="#3B5BB2"
BG="#a3cadc"
VOL_FG="#c423ff"
BRT_FG="#1b95ad"
BAR_BG="#000918"
