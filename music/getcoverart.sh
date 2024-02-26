mpcPath=$(mpc -f "%file%" current)
filePath=$(echo "$HOME/Music/$mpcPath")
dirName=$(dirname "$filePath")
echo $dirName/cover.jpg
