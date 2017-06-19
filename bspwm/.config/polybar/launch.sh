#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.5; done

# Launch bars
polybar volume &
polybar backlight &
polybar clock &
polybar battery &
polybar workspaces &
