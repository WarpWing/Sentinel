echo Good Morning $USER | lolcat

neofetch | lolcat

wget -q https://covid19.trackercli.com | cat index.html > motd.txt | cat motd.txt | lolcat

rm index.html
 # Still doesnt work but I can work with it . It shows up every now and then. I could pipe the entire file through lolcat which it possible. Will look into it in later commits
