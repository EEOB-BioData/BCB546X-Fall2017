#!/bin/bash
set -e
set -u
set -o pipefail

if grep "$1" ${2}.txt > /dev/null &&
	grep "$1" ${3}.txt > /dev/null
then
    echo "found $1 in ${2}.txt and ${3}.txt"
else
	echo "did not find $1 in ${2}.txt and ${3}.txt"
fi
