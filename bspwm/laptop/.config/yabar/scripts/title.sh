#!/bin/bash

xtitle -s |
while read -r title; do
	[[ -z $title ]] && color="!Y u0xff111111 Y!" || color="!Y u0xff1b95ad Y!"
	echo "$color $title "
done
