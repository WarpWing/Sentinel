#!/bin/bash

while :
do
    clear
    cat<<EOF
    ###############################################################################
    # Sentinel Server Tool                                                        #
    # Version : 0.1                                                               #
    ###############################################################################
    #                                                                             #
    #  Please enter your choice:                                                  #
    #                                                                             #
    #  (1) Install Sentinel Core                                                  #
    #  (2) Install Tools                                                          #
    #  (3) Run Diagnostics                                                        #
    #  (4) Update Sentinel Core                                                   #
    #  (0) Exit                                                                   #
    #                                                                             #
    ###############################################################################
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  echo "Ready to install Sentinel Core"          | Sentinel/setup.sh         ;;
    "2")  echo "Ready to install Sentinel Toolkit"       | Sentinel/install.sh       ;;
    "3")  echo "Running Diagnostics"                     | Sentinel/config.sh        ;;
    "4")  echo "Ready to update..."                      | Sentinel/update.sh        ;;
    "0")  exit | reset                                                                 ;;
     * )  echo "Invalid option!"                                                 ;;
    esac
    sleep 1
done