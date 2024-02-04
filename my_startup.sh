#!/bin/sh
xrandr --output HDMI-0 --off --output DP-0 --off --output DP-1 --off --output DP-2 --primary --mode 1920x1080 --pos 1050x366 --rotate normal --output DP-3 --off --output DP-4 --mode 1680x1050 --pos 0x0 --rotate left --output DP-5 --off --output HDMI-1-0 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output DP-1-4 --off --output DP-1-5 --off
xset s off
xset -dpms
xset s noblank
lxpolkit&

