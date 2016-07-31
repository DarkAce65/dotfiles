#!/bin/bash

xtitle -s |
while read -r title; do
	[[ -z $title ]] && color="2d2123" || color="fe8100"
	echo "!Yu0xff${color}Y!"$title
done
