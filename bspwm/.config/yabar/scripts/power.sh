#!/bin/bash

font='Terminusmod:size=10'
screenheight=$(xrandr | grep '*' | awk {'print $1'} | cut -d 'x' -f2)
screenwidth=$(xrandr | grep '*' | awk {'print $1'} | cut -d 'x' -f1)

x=$(($screenwidth - 215))

# kill other dzen processes
pkill -x dzen2

execute() {
	read prog
	echo "Program: ${prog}"
}

echo -e "Power Menu\nLock\nRestart\nShutdown" | dzen2 -l 3 -w 200 -x $x -y 48 -fn $font -bg '#bc1100' -fg '#fbfed3' -p -m -sa c -h 20 -e 'onstart=uncollapse,scrollhome;entertitle=grabkeys;enterslave=grabkeys;leaveslave=ungrabkeys;button1=menuprint_noparse,exit;button3=exit:13;button4=scrollup;button5=scrolldown' | execute
