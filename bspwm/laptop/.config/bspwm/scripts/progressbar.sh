#!/bin/bash

value=${1-50}
label=${2-"label"}
fg=${3-"#777777"}
bg=${4-"#333333"}

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
font='Terminusmod:size=10'
source $DIR/.dimensions
x=$(($screenwidth / 2 - 100))
y=55

pipe="/tmp/dzen2-bar"

if [ ! -e "$pipe" ]; then
	mkfifo "$pipe"
	(dzen2 -tw "200" -h "30" -x "$x" -y "$y" -fn "$font" -fg "#fbfed3" -bg "#2d2123" < "$pipe"
		rm -f "$pipe") &
fi

(echo "$value" | gdbar -l "$label " -fg "$fg" -bg "$bg" -w "140"; sleep 2) > "$pipe"
