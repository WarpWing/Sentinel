echo "Please type the commit message: "
read INPUT   
git add .
git commit -m "$INPUT"
git push -u   
# -F Flag removed
