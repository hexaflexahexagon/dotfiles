#!/bin/bash

# Script to install custom dot files into the home dir. If they already exist, then prompt the user
# asking what they'd like to do. 

# words to filter by when looking for what to copy
names='vimrc|bashrc|bash_aliases|gitconfig'

dst="/home/hex/"

conflict () {
	echo "File \"$file\" already exists!" 
	PS3="Enter a number: "
	select choice in "backup existing file" "show file diff" "overwrite and copy" "abort script"
	do
		case $choice in 
			"backup existing file")
				# create backup
				cp "$home" "$home"-backup-"$(date +%m-%d-%y_%H-%M-%S)"
				echo "Backup created successfully"
				break
				;;
			"show file diff")
				if [[ $( diff "$src" "$home" ) = "" ]]; then
					echo "No difference found in the file content"
				else 
					echo "$src and $home diff:"
					diff "$src" "$home"
				fi
				;;
			"overwrite and copy")
				# do nothing, just overwrite the file
				break
				;;
			"abort script")
				echo "Exiting program..."	
				exit
				;;
			*) echo "Invalid reply \"$REPLY\"";;
		esac
	done
}

for file in $(find . -mindepth 1 -maxdepth 2 -type f); do
	if [[ $(echo "$file" | grep -E $names) ]]; then
		src="$file"	
		home="$dst""$(echo "$file" | cut -d / -f3)"
		
		if [[ -a $home ]]; then
			# it exists already
			conflict
		fi
	
		cp $src $home
		echo "File \"$file\" updated"
	fi
done

