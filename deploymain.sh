#!/bin/bash

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
       sleep 2s
   else 
        echo "Ok, moving on"
fi 