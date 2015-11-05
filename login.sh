#!/bin/bash
#
# Login Bash Source
# 
# Peter Gagliardi
# Version 1.1
# 5/3/15
#
# Tested on GNU Bash 4.2.25
#           Linux 3.13.0
#
# Source all needed files in this
# library.
# 
# USAGE:
# source this script from .bashrc
# . path/to/linux-login/login.sh
#

#Path to this script
LOGIN=${BASH_SOURCE[0]%/*}
#Allow access to prompt.py from anywhere
PATH=$PATH:$LOGIN/prompt

#Include these scripts
source $LOGIN/source/colors.sh
source $LOGIN/source/custom-prompt.sh
source $LOGIN/source/aliases.sh
