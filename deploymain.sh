#!/bin/bash
echo "Please note that this script is aimed for Ubuntu 20.04 Server LTS and up "
sleep 2s
figlet Sentinel Server | lolcat
sleep 1s
echo -n " Would you like to run this in Quick Mode or Verbose Mode"
echo -n "Verbose Mode requires you to choose what is or isn't going to be installed"
echo -n "Quick Mode is Automatic and will choose everything to be installed by default"
sleep 1s
read DECIDEINPUT
if [ $DEPLOYINPUT = y ]
then
  echo "Starting QuickMode Installation"
  sleep 2s
else
  echo "Starting VerboseMode Installation"
  sleep 2s
fi
echo -n "Would you like to start deploying Sentinel Server Files?: "
read DEPLOYINPUT

if [ $DEPLOYINPUT = y ]
then
  echo "Starting installation and deployment of Sentinel Files"
  sleep 2s
else  
  echo "Terminating...."
  sleep 2s
  exit
fi
echo -n "Would you like to install Homebrew?: "
read BREWINPUT 
  if [ $BREWINPUT = y ] 
   then 
       echo "Installing Homebrew" 
       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 
       sleep 3s
       echo "Homebrew has been installed! Continuing with Deployment"
   else 
        echo "Continuing with Installation"
        sleep 2s
fi 
echo -n "Would you like the CUSTOM MOTD included?:"
read MOTDINPUT
    if [ $MOTDINPUT = y ] 
     then 
      echo "Fetching MOTD from Github"
      wget -q https://raw.githubusercontent.com/WarpWing/Sentinel/master/motd.sh 
      sleep 2s 
      chmod a+x motd.sh
      chmod -x /etc/update-motd.d/* 
      mv motd.sh  /etc/update-motd.d/
      echo "MOTD has been installed and automatically moved to the proper directory"
    else 
    echo "Continuing with Installation"
    sleep 2s
fi 
