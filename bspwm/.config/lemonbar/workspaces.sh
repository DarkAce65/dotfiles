#!/bin/bash

source $HOME/.config/lemonbar/config
geometry='200x34+10+10'

function workspaces {
	bspc subscribe report | while read -r line; do
		output="%{c} "
		IFS=':' read -r -a desktops <<< $line
		for index in ${!desktops[@]}; do
			desktopname=${desktops[index]#?}
			case ${desktops[index]} in
				U*)
					output+="%{F${accent}}$(printf '%b' "\ue0b3")%{F-} " ;;
				u*)
					output+="$(printf '%b' "\ue0b3") " ;;
				O*)
					output+="%{F${accent}}$(printf '%b' "\ue000")%{F-} " ;;
				o*)
					output+="$(printf '%b' "\ue000") " ;;
				F*)
					output+="%{F${accent}}$(printf '%b' "\ue001")%{F-} " ;;
				f*)
					output+="$(printf '%b' "\ue001") " ;;
			esac
		done
		printf '%s\n' "${output}"
	done
}

workspaces | lemonbar -bd -n 'workspaces' -g $geometry -o -1 -f "${iconfont}:pixelsize=10" -f "${font}" -F $foreground -B $background
