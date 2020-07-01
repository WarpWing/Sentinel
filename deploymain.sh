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
echo "Would you like to run this in QuickMode or VerboseMode" | lolcat
sleep 3s 
echo  "1. QuickMode (Automatic)" | lolcat
echo  "2. VerboseMode (Manuel)" | lolcat
echo -n "Please choose a method of installaton by Number:" | lolcat
read MODEINPUT
