#!/bin/bash

CMPFILE=${CMPFILE:-/tmp/cmpFile}

if [ -e $CMPFILE ]; then
    compton --config ~/.config/compton/compton.conf &
    dunstify -r -1 "Compton: Enabled"
    rm $CMPFILE
else
    echo $ "compton enabled" >> $CMPFILE
    ps -ef | grep "compton --config" | grep -v grep | awk '{print $2}' | xargs kill
    dunstify -r -1 "Compton: Disabled"
fi
