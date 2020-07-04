#This is the Sentinel QuickMode install script. 
figlet Sentinel QuickMode | lolcat
sleep 2s
echo -n "Strapping in for a quick install of Sentinel" | lolcat
sleep 3s
echo "To make it clear, this will install everything including optional modules. If you are ok with this, press y or n if otherwise: " | lolcat
read CONFIRMINPUT
if [ $CONFIRMINPUT = y ]
    then
    sleep 1s
     echo "Doing Final Checks on Installation" | lolcat
     sleep 2s 
     #Smush all the commands here :) 
     exit
    else 
  echo "Terminating QuickMode Install" | lolcat
  sleep 2s 
  fi 
