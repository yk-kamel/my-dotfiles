#!/bin/bash

RAND=$(find ~/Rice/Current/Wallpaper/Dark/ -type f | shuf -n 1)

hyprctl hyprpaper wallpaper ", $RAND"
