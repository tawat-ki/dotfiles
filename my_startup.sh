#!/bin/sh
xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate left --output DP-0 --primary --mode 1920x1080 --pos 1080x365 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off



xset s off
xset -dpms
xset s noblank
lxpolkit&

