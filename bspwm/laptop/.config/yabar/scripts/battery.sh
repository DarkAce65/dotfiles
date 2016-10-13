#!/bin/bash

battery=0
battery_info=$(acpi -b | grep "Battery ${battery}")
battery_state=$(echo "${battery_info}" | grep -wo "Full\|Charging\|Discharging")
battery_power=$(echo "${battery_info}" | grep -o '[0-9]\+%' | tr -d '%')

color="!Y u0xff606060 Y!"
if [[ $battery_power -lt 20 ]]; then
	color="!Y u0xffa021ce Y!"
fi
if [[ "${battery_state}" = "Charging" ]]; then
	color="!Y u0xff55d0e0 Y!"
fi

output=" ${battery_power}%"

echo $color$output
