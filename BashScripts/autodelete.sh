#!/bin/bash

echo Love $1

if [[ ! -e del.tar.gz ]]; then
	find . -regextype posix-extended -type f -regex '.* \(+[0-9]+\)\.[^/]+' | xargs tar -czvf del.tar.gz  #regex for finding duplicate files and backing them up
elif [[  -e del.tar.gz ]]; then
	find . -regextype posix-extended -type f -regex '.* \(+[0-9]+\)\.[^/]+' | xargs tar -rzvf del.tar.gz # regex for incase  the tar file all ready exists
fi
