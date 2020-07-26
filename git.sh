echo "Please type the commit message: "
read INPUT   
git add .
git commit -m "$INPUT"
git push -u  
reset
echo "Git commit has been pushed and commited to the remote branch"
