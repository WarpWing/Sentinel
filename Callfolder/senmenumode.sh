#!/bin/bash
reset
sleep 2s
while :
do
    clear
    cat<<EOF
    ###############################################################################
    #  Please select a mode to install Sentinel:                                  #
    #                                                                             #
    #  1. Quickmode: This automatically installs everything                       #
    #  2. Verbosemode: This lets you pick what you want and dont want to install  #
    #  3. Quit: This quits the menu                                               #
    #                                                                             #
    ###############################################################################
EOF
sleep 2s
    echo -n "Please choose a option: "
read NUMBER 

echo -n "You have chosen $NUMBER as a option!"
sleep 1s
case $NUMBER in 

    1)
    ./qm.sh
     ;; 
    2)
    ./vm.sh
    ;; 
    3)
    sleep 1s
    reset && exit
    ;;
    *)
    echo -n "$NUMBER is not a option! Please try again"
    ;;

esac 
done 
