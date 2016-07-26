#!/bin/bash

pkill -x dunst
dunst -config ~/.config/dunst/dunstrc &

id=1

id=$(dunstify -p -h int:value:$id -u critical "Test message" "Critical test")
sleep 1
id=$(dunstify -p -h int:value:$id -u normal "Test message" "Normal test")
sleep 1
id=$(dunstify -p -h int:value:$id -u low "Test message" "Low test")
sleep 1
id=$(dunstify -p -h int:value:$id -u critical "Test message" "Critical test 2")
sleep 1
id=$(dunstify -p -h int:value:$id -u normal "Test message" "Normal test 2")
sleep 1
dunstify -h int:value:$id -u low "Test message" "Low test 2"
