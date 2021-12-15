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
	options=("create file backup" "show diff" "overwrite" "skip")
	select choice in "${options[@]}"
	do	
		printf "\n"
		case $choice in 
			"${options[0]}")
				# create backup
				cp "$home" "$home"-backup-"$(date +%m-%d-%y_%H-%M-%S)"
				echo "Backup of \"$home\" created"
				break
				;;
			"${options[1]}")
				echo "< $src and > $home diff:"
				printf "\n"
				diff "$src" "$home"
				printf "\n"
				;;
			"${options[2]}")
				# do nothing, just overwrite the file
				copy="true"
				skip="false"
				break
				;;
			"${options[3]}")
				echo "Skipping \"$home\""	
				copy="false"
				skip="true"
				break
				;;
			*) echo "Invalid reply: \"$REPLY\"";;
		esac
	done
}

while IFS= read -u3 -r -d '' file
do
	if echo "$file" | grep -Eq $names; then
		src="$file"	
		home="$dst""$(echo "$file" | cut -d / -f3)"
		copy="false"
		skip="false"

		if [[ -a $home ]]; then
			# it exists already
			if [[ $( diff "$src" "$home" ) == "" ]]; then
				# ... but they are the same, don't prompt
				true
			else
				conflict
			fi
		fi
	
		if [[ $copy == "true" ]]; then
			cp "$src" "$home"
			echo "File \"$file\" updated"
		elif [[ $skip == "true" ]]; then
			true # say nothing
		else
			echo "File \"$file\" already up-to-date"
		fi
	fi
done 3< <(find . -mindepth 1 -maxdepth 2 -type f -print0)
