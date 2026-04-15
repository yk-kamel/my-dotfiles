#!/bin/bash

RAND=$(find ~/Rice/Current/Wallpaper/Light/ -type f | shuf -n 1)

hyprctl hyprpaper wallpaper ", $RAND"
