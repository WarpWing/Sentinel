echo "Please type the commit message: "
read INPUT   
git add .
git commit -S -m "$INPUT"
git push -u   
