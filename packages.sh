#!/bin/bash

# Curated list of debian-based package names 

# Usage: 
# sudo apt update && sudo apt -y upgrade && sudo apt install -y $( ./packages )

# programs
echo "git"
echo "curl"
echo "ffmpeg"
echo "grep"
echo "vim"
echo "shellcheck"
echo "hexedit"
echo "python3"
echo "less"
echo "man"
echo "screen"
echo "file"
echo "gh"		# I use this sometimes but it's not in default package repos, see: https://github.com/cli/cli/blob/trunk/docs/install_linux.md

# networking
echo "netutils" 
echo "dnsutils" # for dig, nslookup
echo "traceroute"
echo "net-tools" # netstat, route, arp
echo "netcat" 
