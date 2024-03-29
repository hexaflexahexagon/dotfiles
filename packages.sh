#!/bin/bash

# Curated list of debian-based package names 

# Usage: 
# sudo apt update && sudo apt -y upgrade && sudo apt install -y $( ./packages.sh )

# programs
echo "unattended-upgrades" # automated security updates
echo "git"
echo "curl"
echo "ffmpeg"
echo "grep"
echo "vim"
echo "gawk"
echo "shellcheck"
echo "hexedit"
echo "pandoc" 
echo "less"
echo "man"
echo "screen"
echo "dos2unix"
echo "bc"		# cli calculator
#echo "gh"		# I use this but it's not in default package repos
				# see: https://github.com/cli/cli/blob/trunk/docs/install_linux.md

# python stuff
echo "python3"
echo "python3-pip"
echo "python3-venv"
echo "build-essential" 
echo "libssl-dev" 
echo "libffi-dev" 
echo "python3-dev"

# forensics
echo "file"
echo "binutils" # strings
echo "pngcheck"

# networking
echo "dnsutils" # for dig, nslookup
echo "traceroute"
echo "net-tools" # netstat, route, arp
echo "netcat-traditional" 
echo "tcpdump"
echo "mtr-tiny"
echo "nmap"

