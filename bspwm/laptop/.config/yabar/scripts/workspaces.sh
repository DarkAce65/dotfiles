#!/bin/bash

bspc subscribe report |
while read -r line; do
	OUTPUT=""
	IFS=':' read -r -a desktops <<< "$line"
	for index in "${!desktops[@]}"; do
		desktopname="${desktops[index]#?}"
		case ${desktops[index]} in
			U*)
				OUTPUT+="<span color='#c423ff'>*</span> " ;;
			u*)
				OUTPUT+="<span color='#c423ff'>!</span> " ;;
			O*)
				OUTPUT+="<span color='#55d0e0'>*</span> " ;;
			o*)
				OUTPUT+="<span color='#55d0e0'>"$desktopname"</span> " ;;
			F*)
				OUTPUT+="<span color='#505050'>*</span> " ;;
			f*)
				OUTPUT+="<span color='#505050'>"$desktopname"</span> " ;;
		esac
	done
	echo $OUTPUT
done
