#This is the Sentinel QuickMode install script.  
reset
sleep 1s
figlet Sentinel QuickMode 
sleep 2s
echo "Strapping in for a quick install of Sentinel" 
sleep 3s
echo "To make it clear, this will install everything including optional modules. If you are ok with this, press y or n if otherwise: " | lolcat
read CONFIRMINPUT
if [ $CONFIRMINPUT = y ]
    then
    sleep 1s
     echo "Doing Final Checks on Installation" 
     sleep 2s 
     #Smush all the commands here :) 
     exit
    else 
  echo "Terminating QuickMode Install" | lolcat
  sleep 2s 
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/WarpWing/Sentinel/master/Callfolder/InstallMenu.sh)"
  sleep 2s
  fi 
