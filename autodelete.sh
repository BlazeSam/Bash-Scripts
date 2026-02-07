#!/bin/bash
#find . -empty | xargs rm

# if [[ "$#" -ne 1 ]]; then
	# echo "the deleter needs to be given the directory"
	# exit 1
# fi

echo Love $1
if [ -n "$1"]; then
	echo moving to $1 directory
else
	echo "Ensure directory is provided"
fi 

#cd "$(find . -type d -name $1 -print -quit)"

if [[ ! -e del.tar.gz ]]; then
	mkdir -p backup
	find . -type f | grep -E '.* \([0-9]+\)\.[^/]+$' | while IFS= read -r file; do
		mv "$file" ./backup
	done
	for file in backup; do 
		echo $file
	done 
	tar -cvzf del.tar.gz ./backup

elif [[  -e del.tar.gz ]]; then
	tar -xvf del.tar.gz 
	rm -f del.tar.gz
	find . -type f | grep -E '.* \([0-9]+\)\.[^/]+$' | while IFS= read -r file; do
		mv "$file" backup/
	done
	tar -xvf del.tar.gz
fi
