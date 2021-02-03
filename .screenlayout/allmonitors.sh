#!/bin/sh
xrandr --output eDP1 --auto
xrandr --output DP2-1 --primary --auto --right-of eDP1
xrandr --output DP2-2 --auto --right-of DP2-1
i3-msg restart
