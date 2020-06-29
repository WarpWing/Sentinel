echo Good Morning $USER | lolcat

neofetch | lolcat

wget -q https://covid19.trackercli.com/history/us | cat index.html > motd.txt | cat motd.txt | lolcat

sleep 10s

rm index.html 
 # Still doesnt work but I can work with it. Lolcat pipe coming soon
figlet WELCOME BACK $USER | lolcat 