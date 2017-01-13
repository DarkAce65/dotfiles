#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ ! -e /tmp/theme ]]; then
	echo -1 > /tmp/theme
fi
switch=${1:-$(($(cat /tmp/theme) + 1))}

if [[ $switch -gt 1 ]]; then
	switch=0
fi

echo $switch > /tmp/theme
case $switch in
	0)
		cp $DIR/themes/.Xresources.cool ~/.Xresources
		feh --bg-fill /usr/share/backgrounds/skyline.png
		;;
	1)
		cp $DIR/themes/.Xresources.warm ~/.Xresources
		feh --bg-fill /usr/share/backgrounds/landscape.jpg
		;;
esac
xrdb ~/.Xresources
