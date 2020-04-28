#!/bin/bash

if [ $# -ne 1 ]
then
	echo "No arguments given"
	echo 
	echo "Usage:"
	echo "./compiler.sh asm_file"
	exit 1
fi

if [ ! -f $asm_file ]
then
	echo -n $asm_file
	echo " does not exist"
fi

IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing

# Create a tmp file
touch tmp

# Iterate over the asm file removing useless characters
for i in $(cat < "$1"); do
	treated_input=$(echo $i | sed "s/[',', '(']/ /g" | sed "s/[';',')']//g" | tr -s " ")
	if [ $treated_input != "" ] && [ $(echo $treated_input | head -c 1) != "#" ]
	then
		echo $treated_input >> tmp
	fi
done

# Replace tags with addresses
address=0
for i in $(cat < tmp); do
	opcode=$(echo $i | cut -d' ' -f1)
	# Check if this line is a tag
	if [ $(echo $i | grep -o ':' | wc -c) -gt 0 ]
	then
		echo "Tag"
		touch tmp2
		tag=$(echo $i | cut -d' ' -f1 | sed "s/://g")
		for j in $(cat < tmp); do

			# This comparition aims to remove the Tag definition
			# and inserts the address in decimal value
			if [ $j != $i ]
			then
				echo $j | sed "s/$tag/$address/g" >> tmp2
			fi
		done
		rm tmp
		mv tmp2 tmp
	elif [ $opcode == "la" ] || [ $opcode == "li" ]
	then
		address=$(( $address+8 ))
	elif [ $(echo $opcode | head -c 1) != "." ] || [ $opcode == ".word" ]
	then
		address=$(( $address+4 ))
	fi
done