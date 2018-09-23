#!/bin/bash

# Find modeline text with:
# $ cvt <desired resolution>
#
# For standard HD (1920x1080)
# $ cvt 1920 1080
#
# Grab all text AFTER "... Modeline ..."

xrandr --newmode "1600x900_60.00"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync

# xrandr --addmode <display-name> <resolution>
xrandr --addmode Virtual1 1600x900_60.00

# Set resolution for the current Display
xrandr -s 1600x900_60.00
