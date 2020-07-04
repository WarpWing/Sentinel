# A simple menu system
#sudo apt-get install wget neofetch lolcat curl figlet -y 
reset
sleep 1s
figlet Sentinel Server Installer | lolcat
sleep 3s
echo "Please respond with Y or N in most questions" | lolcat
sleep 2s

PS3="Select the installation method: " 

select opt in Quick Verbose Quit; do 

  case $opt in
    Quick)
      echo "Switching to QuickMode installation" | lolcat
      sleep 2s
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/WarpWing/Sentinel/master/sentinelquickmode.sh)" && chmod 777 sentinelquickmode.sh
      ;;
    Verbose)
      echo "Switching to VerboseMode installation" | lolcat
      sleep 2s
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/WarpWing/Sentinel/master/sentinelverbosemode.sh)" && chmod 777 sentinelverbosemode.sh
      ;;
    Quit)
      break
      ;;
    *) 
      echo "Invalid response $REPLY"
      echo "Please try a valid option :)"
      ;;
  esac
done