#!/bin/bash

light -Sc 5
percentage=$(printf "%.0f" $(light -G))
case $1 in
	up)
		percentage=$(($percentage + 5)) ;;
	down)
		percentage=$(($percentage - 5)) ;;
esac

light -Sb $percentage
percentage=$(printf "%.0f" $(light -G))
label="$percentage%"
label=$(printf "%4s" $label)

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh
$DIR/progressbar.sh $percentage "$label" $BRT_FG
