#! /usr/bin/bash

# $1 is the scaphandre file to parse

sudo rm `find . -iname *.parsed`

for file in `find . -iname scaph*`; do
	cat $file | sed 's/{"host"/\n{"host"/g' | head -n -2 > $file.parsed
done
