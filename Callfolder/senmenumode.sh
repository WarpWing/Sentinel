#!/bin/bash
reset
sleep 2s
while :
do
    clear
    cat<<EOF
    ###############################################################################
    #  Sentinel Install Menu                                                      #
    #                                                                             #
    #  1. Start Installation                                                      # 
    #  2. Quit Installation                                                       #
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
    sleep 1s
    reset && exit
    ;;
    *)
    echo -n "$NUMBER is not a option! Please try again"
    ;;

esac 
done 
