#!/bin/bash
# Execute via screen at 10am
while true; do
    echo Starting Wallpaper Cycle!
    sleep 5h 45m
    /usr/local/bin/setwallpaper /home/warpwing/code/dynamic-wallpaper/images/market/18.jpg
    sleep 1h 45m
    /usr/local/bin/setwallpaper /home/warpwing/code/dynamic-wallpaper/images/market/20.jpg
    sleep 13h 30m 
    /usr/local/bin/setwallpaper /home/warpwing/code/dynamic-wallpaper/images/market/6.jpg
    sleep 3h 30m
    /usr/local/bin/setwallpaper /home/warpwing/code/dynamic-wallpaper/images/market/9.jpg
    sleep 1h 30m
    echo Wallpaper Cycle complete! 
done