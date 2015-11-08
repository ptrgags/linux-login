#!/bin/bash
#
# Colors Bash Source
# 
# Peter Gagliardi
# Version 1.1
# 5/3/15
#
# Tested on GNU Bash 4.2.25
#           Linux 3.13.0
#			
# Color constants and utility functions
# for use in the shell
#
# This script is sourced from login.sh
#

#ANSI color codes
export BLACK='\e[30m'
export RED='\e[31m'
export GREEN='\e[32m'
export YELLOW='\e[33m'
export BLUE='\e[34m'
export MAGENTA='\e[35m'
export CYAN='\e[36m'
export WHITE='\e[37m'

#Other settngs
export NORMAL='\e[0m'
export BOLD='\e[1m'
export UNDERLINE='\e[4m'

# colorEcho COLOR TEXT
colorEcho() {
	#Use a subshell to prevent exporting the variables
	(
		#delimiters for non-printable 
		#characters (color codes)
		START='\x01'
		END='\x02'
		echo -e "$START$1$END$2$START$NORMAL$END"
	)
}
