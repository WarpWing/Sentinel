#!/bin/bash

while :
do
    clear
    cat<<EOF
    ###############################################################################
    #    Please select a mode to install Sentinel:                                #
    #                                                                             #
    #  1. Quickmode: This automatically installs everything                       #
    #  2. Verbosemode: This lets you pick what you want and dont want to install  #                                                                      
    ###############################################################################
EOF

echo -n "Please choose a option: "
read NUMBER 

echo -n "You have chosen $NUMBER as a option!"
sleep 1s
case $NUMBER in 

    1)
    echo "Quickmode"
    ./qm.sh
     ;; 
    2)
    echo "Verbosemode"
    ./vm.sh
    ;; 
    *)
    echo -n "$NUMBER is not a option! Please try again"

esac 
done 
