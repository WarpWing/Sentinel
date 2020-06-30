#This is the Sentinel QuickMode install script. 
echo -n "This is the Sentinel QuickMode Install. Please confirm the install by pressing Y to start or N to abort"
read QUICKMODE 

if [ $QUICKMODE = y ] 
    then 
        sleep 2s
     #Start pasting commands here 
    
    else 
    echo "Ok, aborting installation"
    