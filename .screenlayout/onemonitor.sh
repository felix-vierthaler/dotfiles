#!/bin/sh
xrandr --output eDP1 --primary --auto
xrandr --output DP2-1 --off
xrandr --output DP2-2 --off
i3-msg restart
