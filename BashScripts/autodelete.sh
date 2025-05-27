#!/bin/bash
#find . -empty | xargs rm

# if [[ "$#" -ne 1 ]]; then
	# echo "the deleter needs to be given the directory"
	# exit 1
# fi

echo Love $1

if [[ ! -e del.tar.gz ]]; then
	find . -regextype posix-extended -type f -regex '.* \(+[0-9]+\)\.[^/]+' | xargs tar -czvf del.tar.gz 
elif [[  -e del.tar.gz ]]; then
	find . -regextype posix-extended -type f -regex '.* \(+[0-9]+\)\.[^/]+' | xargs tar -rzvf del.tar.gz 
fi
