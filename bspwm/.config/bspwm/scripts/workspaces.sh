#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

width=200
x=$((SCREENWIDTH - MARGIN - width))
y=10

geometry="${width}x${BAR_HEIGHT}+${x}+${y}"

function workspaces {
	bspc subscribe report | while read -r line; do
		output="%{c} "
		IFS=':' read -r -a desktops <<< $line
		for index in ${!desktops[@]}; do
			desktopname=${desktops[index]#?}
			case ${desktops[index]} in
				U*)
					output+="%{F${FG_ACCENT}}$(printf '%b' "\ue0b3")%{F-} " ;;
				u*)
					output+="$(printf '%b' "\ue0b3") " ;;
				O*)
					output+="%{F${FG_ACCENT}}$(printf '%b' "\ue000")%{F-} " ;;
				o*)
					output+="$(printf '%b' "\ue000") " ;;
				F*)
					output+="%{F${FG_ACCENT}}$(printf '%b' "\ue001")%{F-} " ;;
				f*)
					output+="$(printf '%b' "\ue001") " ;;
			esac
		done
		printf '%s\n' "${output}"
	done
}

workspaces | lemonbar -d -n 'workspaces' -b -g $geometry -f $FONT -f $FONT_ICON -F $FG -B $BG
