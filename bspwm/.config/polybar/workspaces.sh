#!/bin/bash

focused=$(crudini --get $HOME/.config/polybar/config colors accent)
bspc subscribe report | while read -r line; do
	output="%{c} "
	IFS=':' read -r -a desktops <<< $line
	for index in ${!desktops[@]}; do
		desktopname=${desktops[index]#?}
		case ${desktops[index]} in
			U*)
				output+="%{F${focused}}$(printf '%b' "\ue0b3")%{F-} " ;;
			u*)
				output+="$(printf '%b' "\ue0b3") " ;;
			O*)
				output+="%{F${focused}}$(printf '%b' "\ue000")%{F-} " ;;
			o*)
				output+="$(printf '%b' "\ue000") " ;;
			F*)
				output+="%{F${focused}}$(printf '%b' "\ue001")%{F-} " ;;
			f*)
				output+="$(printf '%b' "\ue001") " ;;
		esac
	done
	printf '%s\n' "${output}"
done
