#!/bin/bash

bspc subscribe report |
while read -r line; do
	OUTPUT=""
	IFS=':' read -r -a desktops <<< "$line"
	for index in "${!desktops[@]}"; do
		desktopname="${desktops[index]#?}"
		case ${desktops[index]} in
			U*)
				OUTPUT+="<span color='#bc1100'>*</span> " ;;
			u*)
				OUTPUT+="<span color='#bc1100'>!</span> " ;;
			O*)
				OUTPUT+="<span color='#fe8100'>*</span> " ;;
			o*)
				OUTPUT+="<span color='#fe8100'>"$desktopname"</span> " ;;
			F*)
				OUTPUT+="<span color='#6c3900'>*</span> " ;;
			f*)
				OUTPUT+="<span color='#6c3900'>"$desktopname"</span> " ;;
		esac
	done
	echo $OUTPUT
done
