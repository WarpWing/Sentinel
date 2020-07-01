figlet Sentinel VerboseMode | lolcat
sleep 2s
echo "Strapping in for a precise install of Sentinel"
sleep 1s
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
