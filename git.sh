echo "Please type the commit message: "
read INPUT   
git add .
git commit -m "$INPUT"
<<<<<<< HEAD
git push -u  
=======
git push -u origin master
git push
#Added extra git push to account for extra branches 
>>>>>>> a5bdf1cf77cff8fc6cf22775556550c98606921a
echo "Git commit has been pushed and commited to the remote branch"
