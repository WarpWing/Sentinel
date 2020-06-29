#!/bin/bash
echo "Please note that this script is aimed for Ubuntu 20.04 LTS and up "
sleep 2s 
echo -n "Would you like to start deploying Sentinel Server Files?: "
read INPUT

if [ $INPUT = y ]
then
  echo "Starting installation and deployment of Sentinel Files"
  sleep 2s
else  
  echo "Terminating...."
  sleep 2s
fi 
echo -n "Would you like to install Homebrew?: "
read INPUT 
  if [ $INPUT = y ] 
   then 
       echo "Installing Homebrew" 
       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 
       sleep 3s
       echo "Homebrew has been installed! Continuing with Deployment"
   else 
        echo "Continuing with Installation"
fi 