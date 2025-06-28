#!/bin/bash

lid_state=$(awk '{print $2}' /proc/acpi/button/lid/LID/state )
number_of_monitors=$(xrandr --listactivemonitors | grep Monitors | cut -d ' ' -f 2)

if [ "$lid_state" = "open" ]; then
    if [ "$number_of_monitors " -eq 2 ]; then
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off
    else
        xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DP-2 --off
    fi
elif [ "$lid_state" = "closed" ] && [ "$number_of_monitors " -eq 2 ]; then
    xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off
else
    exit 1
fi
