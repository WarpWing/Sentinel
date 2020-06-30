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