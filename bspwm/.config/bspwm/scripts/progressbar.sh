#!/bin/bash

value=${1-50}
label=${2-'label'}
fg=$(crudini --get $HOME/.config/polybar/config 'colors' 'foreground')
bg=$(crudini --get $HOME/.config/polybar/config 'colors' 'background')
barfg=${3-$(crudini --get $HOME/.config/polybar/config 'colors' 'bar-foreground')}
barbg=${4-$(crudini --get $HOME/.config/polybar/config 'colors' 'bar-background')}

width=200
x=20
y=45

geometry="${width}x35+${x}-${y}"

pipe='/tmp/progressbar'

if [ ! -e $pipe ]; then
	mkfifo $pipe
	(dzen2 -geometry $geometry -fn 'IosevkaTerm:size=9:style=bold' -fg $fg -bg $bg < $pipe
	rm -f $pipe) &
fi

(echo $value | gdbar -l "${label} " -fg $barfg -bg $barbg -w 140; sleep 3) > $pipe
