figlet Sentinel Server | lolcat
sleep 3s
echo -n "Would you like to start deploying Sentinel Server Files?: " |lolcat
read DEPLOYINPUT
if [ $DEPLOYINPUT = y ]
then
  echo "Starting installation and deployment of Sentinel Files" | lolcat
  sleep 2s
else  
  echo "Terminating...." | lolcat
  sleep 2s
  exit
fi
echo -n "Would you like to run this in QuickMode or VerboseMode"
sleep 1s
echo "Quickmode"