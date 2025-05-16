#!/bin/bash
#find . -empty | xargs rm

# if [[ "$#" -ne 1 ]]; then
	# echo "the deleter needs to be given the directory"
	# exit 1
# fi

echo Love $1
eif 1[[ test -f recent.tar ]]
find . -regextype posix-extended -type f -regex '.* \(+[0-9]+\)\.[^/]+'

