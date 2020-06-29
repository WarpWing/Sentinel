#!/bin/bash

echo -n "Would you like to start deploying Sentinel Server Files?: "
read INPUT

if [ $INPUT = y ]
then
  echo "Starting installation and deployment of Sentinel Files"
  sleep 3s
else  
  echo "Terminating...."
  sleep 2s
fi