#!/bin/bash

df -hPl $HOME | awk '
/\/.*/ {
	gsub(/%$/, "", $5)
	space=$4

	if($5 > 90) {
		color="!Y bg0xffd33200 u0xffaa0000 Y!"
	}
	else {
		color="!Y bg0xff2d2123 u0xff3a4f54 Y!"
	}

	exit 0
}

END {
	print color" "space
}'