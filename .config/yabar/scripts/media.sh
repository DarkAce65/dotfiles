#!/bin/bash

info_title=$(playerctl metadata title)
info_artist=$(playerctl metadata artist)

if [[ "${info_title}" != "" ]] && [[ "${info_artist}" != "" ]]; then
	echo "!Yu0xff7f4039Y!${info_title} - ${info_artist}"
else
	echo "!Yu0xff2d2123Y!"
fi
