echo "Please type the commit message: "
read INPUT   
git add .
git commit -m "$INPUT"
git push -u origin master
git push //Added extra git push to account for extra branches 
echo "Git commit has been pushed and commited to the remote branch"
