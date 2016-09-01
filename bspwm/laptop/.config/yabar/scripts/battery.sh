#!/bin/bash

battery=0
battery_info=$(acpi -b | grep "Battery ${battery}")
battery_state=$(echo "${battery_info}" | grep -wo "Full\|Charging\|Discharging")
battery_power=$(echo "${battery_info}" | grep -o '[0-9]\+%' | tr -d '%')

color="!Y bg0xff111111 u0xff788249 Y!"
if [[ $battery_power -lt 15 ]]; then
	color="!Y bg0xffd33200 u0xffaa0000 Y!"
fi
if [[ "${battery_state}" = "Charging" ]]; then
	color="!Y bg0xff111111 u0xff77ddd9 Y!"
fi

output=" ${battery_power}%"

echo $color$output
