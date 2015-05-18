# Custom Prompt Bash Source
# 
# Peter Gagliardi
# Version 1.0
# 5/18/15
#
# Tested on GNU Bash 4.2.25
#           Linux 3.13.0
#			
# A collection of prompts to choose from. More
# will be added over time.
# 
# This file is sourced from login-source.sh 
#
# DEPENDENCIES:
# colors.sh (must be sourced)
# 
# USAGE:
# See each function for specific usage
#

# Prompt I made for my account on
# Drexel's servers
# TODO: Make this more generic
# TODO: Add color options 
drexelPrompt() {
	COLOR1="\[$RED\]"
	COLOR2="\[$CYAN\]"
	COLOR3="\[$YELLOW\]"
	COLOROFF="\[$NORMAL\]"
	PS1="$COLOR1<$COLOR2\u$COLOR1@\h:$COLOR3\w$COLOR1>$COLOROFF"
	unset COLOR1
	unset COLOR2
	unset COLOR3
	unset COLOROFF
}

# Single color prompt
# Format:
# user@host /current/directory >
# Usage:
# colorPrompt COLOR
colorPrompt() {	
	PS1="\[$1\]\u@\h \w >\[$NORMAL\]"
}

# LISP-like prompt
# Format:
# (user host /current/directory)
# >
# Usage:
# lispPrompt 
# TODO: Add color options
lispPrompt() {
	PS1="\[$YELLOW\](\u \h \w)\n\[$CYAN\]>\[$NORMAL\]"
}

# Fun two-line prompt including a smiley indicating
# sucess of the last status
# Format:
# [user@host]-[/current/directory]-[:)]
# -->
# Usage:
# bracketPrompt
# TODO: Make this code more elegant
bracketPrompt() {	
	SMILEY='$(if [ $? = 0 ]; then colorEcho $GREEN ":)"; else colorEcho $RED ":( $?"; fi)'

	DIRECT="\[$CYAN\]\w"
	COLOR1="\[$MAGENTA\]"

	ADDRESS="\[$YELLOW\]\u@\h"
	SEPARATOR="\[$WHITE\]]-["

	PS1="[$ADDRESS$SEPARATOR$DIRECT$SEPARATOR$SMILEY]\n-->\[$NORMAL\]"
	unset DIRECT
	unset ADDRESS
	unset SEPARATOR
}
