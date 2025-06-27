#!/bin/bash

lid_state=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')

if [ "$lid_state" = "open" ]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off
elif [ "$lid_state" = "closed" ]; then
    xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off
else
    exit 1
fi
