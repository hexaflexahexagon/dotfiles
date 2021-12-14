#!/bin/bash

# Script to install custom dot files into the home dir. If they already exist, then prompt the user
# asking what they'd like to do. 

# words to filter by when looking for what to copy
names='vimrc|bashrc|bash_aliases|gitconfig'

dst="/home/$USER/"

conflict () {
	printf "\n"
	echo "File \"$file\" already exists!" 
	PS3="Enter a number: "
	select choice in "create file backup" "show diff" "overwrite" "skip"
	do		
		printf "\n"
		case $choice in 
			"create file backup")
				# create backup
				cp "$home" "$home"-backup-"$(date +%m-%d-%y_%H-%M-%S)"
				echo "Backup of \"$home\" created"
				break
				;;
			"show diff")
				echo "< $src and > $home diff:"
				printf "\n"
				diff "$src" "$home"
				printf "\n"
				;;
			"overwrite")
				# do nothing, just overwrite the file
				break
				;;
			"skip")
				echo "Skipping \"$home\""	
				copy="false"
				break
				;;
			*) echo "Invalid reply: \"$REPLY\"";;
		esac
	done
}

while IFS= read -r -d '' file
do
	if echo "$file" | grep -Eq $names; then
		src="$file"	
		home="$dst""$(echo "$file" | cut -d / -f3)"
		copy="true"

		if [[ -a $home ]]; then
			# it exists already
			if [[ $( diff "$src" "$dst" ) == "" ]]; then
				# ... but they are the same, don't prompt
				true
			else
				conflict
			fi
		fi
	
		if [[ $copy == "true" ]]; then
			cp "$src" "$home"
			echo "File \"$file\" updated"
		fi
	fi
done < <(find . -mindepth 1 -maxdepth 2 -type f -print0)
