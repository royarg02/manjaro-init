#!/usr/bin/env bash

curr_batt_percent=$(upower -i $(upower -e | grep BAT) | grep -i "percentage" | awk '{print $2}')
echo "The current battery charge is at $curr_batt_percent."

