#!/bin/bash
#
# Aliases Bash Script
# 
# Peter Gagliardi
# Version 1.0
# 5/3/15
#
# Tested on GNU Bash 4.2.25
#           Linux 3.13.0
#			
# A list of useful aliases. This
# script is sourced from login.sh
#
# Comment out any of these aliases if you 
# do not want them
#
# TODO: Look up many more aliases to add 
#

#color program output
alias ls='ls -F --color=auto'
alias grep='grep --color=auto'
alias less='less -R' #Print non-printing characters like color codes

#Always ask before modifying files
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#Cycle through dirs after using pushd
alias fw='pushd +1'
alias bw='pushd -0'
 