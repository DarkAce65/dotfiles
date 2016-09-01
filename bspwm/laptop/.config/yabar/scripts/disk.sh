#!/bin/bash

df -hPl $HOME | awk '
/\/.*/ {
	gsub(/%$/, "", $5)
	space=$4

	if($5 > 90) {
		color="!Y u0xffa021ce Y!"
	}
	else {
		color="!Y u0xff606060 Y!"
	}

	exit 0
}

END {
	print color" "space
}'