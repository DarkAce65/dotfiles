#!/bin/bash

bspc subscribe report |
while read -r line; do
	OUTPUT=""
	IFS=':' read -r -a desktops <<< "$line"
	for index in "${!desktops[@]}"; do
		desktopname="${desktops[index]#?}"
		case ${desktops[index]} in
			U*)
				OUTPUT+="<span color='#55d0e0'>*</span> " ;;
			u*)
				OUTPUT+="<span color='#55d0e0'>!</span> " ;;
			O*)
				OUTPUT+="<span color='#bbbbbb'>*</span> " ;;
			o*)
				OUTPUT+="<span color='#bbbbbb'>"$desktopname"</span> " ;;
			F*)
				OUTPUT+="<span color='#444444'>*</span> " ;;
			f*)
				OUTPUT+="<span color='#444444'>"$desktopname"</span> " ;;
		esac
	done
	echo $OUTPUT
done
