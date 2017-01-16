#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

height="35"
width="200"
x=$((SCREENWIDTH - WINDOW_GAP - width))
y="10"

geometry="${width}x${height}+${x}+${y}"

function workspaces {
	bspc subscribe report | while read -r line; do
		OUTPUT="%{c} "
		IFS=':' read -r -a desktops <<< "$line"
		for index in "${!desktops[@]}"; do
			desktopname="${desktops[index]#?}"
			case ${desktops[index]} in
				U*)
					OUTPUT+="%{F${FG_ACCENT}}$(printf "%b" "\ue0b3")%{F-} " ;;
				u*)
					OUTPUT+="$(printf "%b" "\ue0b3") " ;;
				O*)
					OUTPUT+="%{F${FG_ACCENT}}$(printf "%b" "\ue000")%{F-} " ;;
				o*)
					OUTPUT+="$(printf "%b" "\ue000") " ;;
				F*)
					OUTPUT+="%{F${FG_ACCENT}}$(printf "%b" "\ue001")%{F-} " ;;
				f*)
					OUTPUT+="$(printf "%b" "\ue001") " ;;
			esac
		done
		printf "%s\n" "$OUTPUT"
	done
}

workspaces | lemonbar -d -n "workspaces" -b -g $geometry -f $FONT -f $FONT_ICON -F $FG -B $BG &
