#!/bin/bash

xrandr --newmode $(cvt 1600 900 | grep Modeline | cut -d' ' -f 2-20)

xrandr --addmode Virtual1 1600x900

xrandr -s 1600x900
