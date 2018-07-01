#!/bin/bash

source $HOME/.config/lemonbar/config
value=${1-50}
fill=$((18 * value / 100))
empty=$((18 - fill))

output="%{F${barfg}}"
while [[ $fill -gt 0 ]]; do
	output+='■'
	fill=$((fill - 1))
done
output+="%{F-}%{F${barbg}}"
while [[ $empty -gt 0 ]]; do
	output+='■'
	empty=$((empty - 1))
done
output+='%{F-}'

echo $output
