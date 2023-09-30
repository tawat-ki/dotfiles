#!/bin/bash
picom&
lxpolkit&
#3070
#xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate left --output DP-0 --off --output DP-1 --off --output DP-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3 --off --output DP-4 --off --output DP-5 --off --output HDMI-1-0 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output DP-1-4 --off --output DP-1-5 --off
xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate left --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off

#3060
#xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate left --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off
#xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate left --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-5 --off --output HDMI-1-0 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output DP-1-4 --off --output DP-1-5 --off

xset s off
xset -dpms
xset s noblank

