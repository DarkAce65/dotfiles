#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $DIR/config.sh

value=${1-50}
label=${2-'label'}
barfg=${3-'#888888'}
barbg=${4-$BAR_BG}

height=35
width=200
x=$WINDOW_GAP
y=$((10 + height))

geometry="${width}x${height}+${x}-${y}"

pipe='/tmp/progressbar'

if [ ! -e $pipe ]; then
	mkfifo $pipe
	(dzen2 -geometry $geometry -fn $FONT -fg $FG -bg $BG < $pipe
	rm -f $pipe) &
fi

(echo $value | gdbar -l $label  -fg $barfg -bg $barbg -w 140; sleep 3) > $pipe
