#!/bin/bash

xtitle -s |
while read -r title; do
	[[ -z $title ]] && color="2d2123" || color="d33200"
	echo "!Yu0xff${color}Y! "$title" "
done
