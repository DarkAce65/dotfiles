#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

temp="/tmp/brightness"
if [[ -e $temp ]]; then
	percentage=$(cat $temp)
else
	percentage=$(xbacklight -get)
fi

case $1 in
	up)
		percentage=$(($percentage + 5)) ;;
	down)
		percentage=$(($percentage - 5)) ;;
esac
if [[ $percentage -lt 5 ]]; then
	percentage=5
elif [[ $percentage -gt 100 ]]; then
	percentage=100
fi

echo $percentage > $temp
xbacklight -set $percentage -fps 30 &
label="$percentage%"
label=$(printf "%4s" $label)

$DIR/progressbar.sh $percentage "$label" $BAR_FG
