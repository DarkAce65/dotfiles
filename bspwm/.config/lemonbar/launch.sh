#!/bin/bash

# Terminate already running bar instances
killall -q lemonbar

# Wait until the processes have been shut down
while pgrep -x lemonbar > /dev/null; do sleep 0.5; done

# Launch bars
$HOME/.config/lemonbar/workspaces.sh &
$HOME/.config/lemonbar/clock.sh &
$HOME/.config/lemonbar/battery.sh &
$HOME/.config/lemonbar/volume.sh &
$HOME/.config/lemonbar/brightness.sh &
