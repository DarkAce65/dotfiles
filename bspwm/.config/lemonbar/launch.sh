#!/bin/bash

# Terminate already running bar instances
killall -s SIGKILL workspaces.sh
killall -s SIGKILL clock.sh
killall -s SIGKILL battery.sh
killall -s SIGKILL volume.sh
killall -s SIGKILL brightness.sh

# Launch bars
$HOME/.config/lemonbar/workspaces.sh &
$HOME/.config/lemonbar/clock.sh &
$HOME/.config/lemonbar/battery.sh &
$HOME/.config/lemonbar/volume.sh &
$HOME/.config/lemonbar/brightness.sh &

sleep 1
xdo below -t $(xdo id -n root) $(xdo id -a workspaces)
xdo below -t $(xdo id -n root) $(xdo id -a clock)
xdo below -t $(xdo id -n root) $(xdo id -a battery)
xdo below -t $(xdo id -n root) $(xdo id -a volume)
xdo below -t $(xdo id -n root) $(xdo id -a brightness)
