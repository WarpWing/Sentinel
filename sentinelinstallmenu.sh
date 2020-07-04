#Put Beta Install Menu Stuff here
#!/bin/bash
# A simple menu system
PS3="Enter a number: "

select mode in SentinelQuickMode SentinelVerboseMode Quit
do
    echo "Selected mode: $mode"
    echo "Selected number: $REPLY"
done
