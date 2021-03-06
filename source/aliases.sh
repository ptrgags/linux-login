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
# do not want them.
#
# Some of these are borrowed from 
# http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
#
#
#

#color program output
alias ls='ls -F --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias less='less -R' #Print non-printing characters like color codes

#ls aliases that Ubuntu sometimes gives you:
alias ll='ls -al'
alias la='ls -A'
alias l='ls -C'

#Always ask before modifying files
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#Set permissions
alias cx='chmod +x'
alias cw='chmod +w'

#Cycle through dirs after using pushd
alias fw='pushd +1'
alias bw='pushd -0'

#Go up a few levels
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Usually I want to ssh with x-forwarding
alias ssh='ssh -X'

#Expand softlinks
alias expandlink='cd $(pwd -P)'

#Run Python modules
alias pym='python -m'

#Python debugger and profiler
alias pdb='pym pdb'
alias pprof='pym cProfile'

#Search for proceses for the current user
alias psearch='ps ux | grep'
alias pysearch='psearch python'

#Compile CoffeeScript code with watch enabled.
alias mkcoffee='coffee -w -o scripts/ coffee/'

#Pretty git graph. Borrowed from
#http://stackoverflow.com/questions/1057564/pretty-git-branch-graphs
# with some minor customizations
alias gitgraph=$'git log --graph --abbrev-commit --decorate --date=relative --format=format:\'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- [%an]%C(reset)%C(bold yellow)%d%C(reset)\' --all'
#Git Graph in date order
alias gitgraphd='gitgraph --date-order'

# List the contents of a zip file
alias zipl='unzip -l'

# throw errors instead of warnings on missing files
# I've been burned before...
alias zip='zip --must-match'
