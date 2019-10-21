#!/bin/bash

power_off=$(printf '\uf1c0')
reboot=$(printf '\uf1c4')
lock=$(printf '\uf18f')
log_out=$(printf '\uf191')

selected=$(echo -e "${power_off}\n${reboot}\n${lock}\n${log_out}" | rofi -theme power -dmenu -selected-row 2)
case $selected in
$power_off) shutdown -P now ;;
$reboot) reboot ;;
$lock)dm-tool lock;;
$log_out) pkill -P $(pgrep -ox bar)
 bspc quit;;
esac
