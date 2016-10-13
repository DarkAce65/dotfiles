#!/bin/bash

CMPFILE="/tmp/cmpFile"

if [ -e $CMPFILE ]; then
    compton --config ~/.config/compton/compton.conf &
    rm $CMPFILE
else
    echo $ "compton enabled" >> $CMPFILE
    ps -ef | grep "compton --config" | grep -v grep | awk '{print $2}' | xargs kill
fi
