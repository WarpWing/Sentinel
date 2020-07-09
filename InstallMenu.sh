#!/bin/bash

###############################################################################
# Menu                                                                        #
###############################################################################
#This was adapted from a example menu
while :
do
    clear
    cat<<EOF
    ###############################################################################
    # Sentinel Server Installer                                                   #
    # Version : 0.1                                                               #
    ###############################################################################
    #                                                                             #
    #  Please enter your choice:                                                  #
    #                                                                             #
    #  (1) Install Sentinel                                                       #
    #  (2) Install Applications                                                   #
    #  (3) Run Diagnostics                                                        #
    #  (4) Update                                                                 #
    #  (0) Exit                                                                   #
    #                                                                             #
    ###############################################################################
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  echo "Ready to install Homebrew..."            | $BIN/setup.sh         ;;
    "2")  echo "Ready to install macOS..."               | $BIN/install.sh       ;;
    "3")  echo "Ready to configure macOS"                | $BIN/config.sh        ;;
    "4")  echo "Ready to update..."                      | $BIN/update.sh        ;;
    "0")  exit                                                                   ;;
     * )  echo "Invalid option!"                                                 ;;
    esac
    sleep 1
done