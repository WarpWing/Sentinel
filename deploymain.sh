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
echo "Would you like to run this in QuickMode or VerboseMode?" | lolcat
sleep 1s 
echo  "1. QuickMode (Automatic)" | lolcat
sleep 1s
echo  "2. VerboseMode (Manuel)" | lolcat
sleep 1s
echo -n "Please choose a method of installaton by Number:" | lolcat
read MODEINPUT
if [ $MODEINPUT = 1 ] 
then 
 echo "Switching to QuickMode installation" | lolcat
 sleep 3s
 #Put Quickmode script cat here
else 
 echo "Switching to VerboseMode installation" | lolcat
 sleep 3s 
 #Put Verbosemode script cat here
 fi 