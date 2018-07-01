#!/bin/bash

temp='/tmp/brightness'
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
