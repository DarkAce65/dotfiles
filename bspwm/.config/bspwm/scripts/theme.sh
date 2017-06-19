#!/bin/bash

tfile='/tmp/theme'
if [[ ! -e $tfile ]]; then
	echo '0' > $tfile
fi

if [[ $# -eq 0 ]]; then
	tnum=$(cat $tfile)
else
	while [[ $# -gt 0 ]]; do
		case $1 in
			-i|--inc)
				shift
				tnum=$(($(cat $tfile) + 1))
				;;
			-s|--set)
				shift
				if [[ $# -gt 0 ]]; then
					tnum=$1
				else
					echo 'No theme specified.'
					exit 1
				fi
				shift
				;;
			*)
				break
				;;
		esac
	done
fi

if [[ $tnum -lt 0 || $tnum -gt 2 ]]; then
	tnum=0
fi

echo $tnum > $tfile
case $tnum in
	0)
		feh --bg-fill /usr/share/backgrounds/landscape.jpg
		border_color='#fd7e49'
		theme='.warm'
		;;
	1)
		feh --bg-fill /usr/share/backgrounds/skyline.png
		border_color='#3ea290'
		theme='.cool'
		;;
	2)
		feh --bg-fill /usr/share/backgrounds/mono.png
		border_color='#aaaaaa'
		theme='.mono'
		;;
esac

bspc config normal_border_color    '#444444'
bspc config focused_border_color   $border_color
bspc config presel_feedback_color  $border_color

cp "${HOME}/.config/themes/.Xresources${theme}" $HOME/.Xresources
crudini --merge $HOME/.config/polybar/config < "${HOME}/.config/themes/colors${theme}"
xrdb $HOME/.Xresources
$HOME/.config/polybar/launch.sh
