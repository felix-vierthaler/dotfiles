#!/bin/sh
xrandr --output eDP1 --off
xrandr --output DP2-1 --primary --auto
xrandr --output DP2-2 --auto --right-of DP2-1
i3-msg restart
