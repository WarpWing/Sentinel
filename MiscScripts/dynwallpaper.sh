#!/bin/bash

# Check the hour and set the wallpaper
EXCAT=$(date)
HOUR=$(date +%H)
while true; do 
    case "$HOUR" in
    08|09|10|11|12|13|14|15)
    /usr/local/bin/setwallpaper /home/warpwing/code/dynamic-wallpaper/images/market/9.jpg
    ;;
    06|07|16|17)
    /usr/local/bin/setwallpaper /home/warpwing/code/dynamic-wallpaper/images/market/18.jpg
    ;;
    *)
    /usr/local/bin/setwallpaper /home/warpwing/code/dynamic-wallpaper/images/market/20.jpg
    ;;
    esac
done