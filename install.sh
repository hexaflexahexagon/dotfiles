#!/bin/bash

script="script.sh"

# Loop through all directories, run scriptname.sh if it exists
dirs="$( ls -l | grep ^d | cut -d' ' -f9 )"

for dir in */; do
	pushd $dir 1>/dev/null || return
	# check if each file exists, make backup if so (unless given overrite flag), then copy to home
	# /bin/bash $script
	popd 1>/dev/null || return
done
