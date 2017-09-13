#!/bin/bash

# Terminate already running bar instances
killall workspaces.sh
killall clock.sh
killall battery.sh
killall volume.sh
killall brightness.sh

# Launch bars
$HOME/.config/lemonbar/workspaces.sh &
$HOME/.config/lemonbar/clock.sh &
$HOME/.config/lemonbar/battery.sh &
$HOME/.config/lemonbar/volume.sh &
$HOME/.config/lemonbar/brightness.sh &
