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

cd "$(find . -type d -name $1 -print -quit)"

mkdir -p backup

if [[ ! -e del.tar.gz ]]; then
	find . -regextype posix-extended -type f -regex '.* \(+[0-9]+\)\.[^/]+' -print0 |
	while IFS= read -r -d ' ' file; do
		mv "$file" ./backup
	done	
elif [[  -e del.tar.gz ]]; then
	find . -regextype posix-extended -type f -regex '.* \(+[0-9]+\)\.[^/]+' | xargs tar -rzvf del.tar.gz 
fi
