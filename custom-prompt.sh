# Custom Prompt Bash Source
# 
# Peter Gagliardi
# Version 1.2
# 11/4/15
#
# A collection of sample prompts to choose from. More
# will be added over time.
# 
# This file is sourced from login-source.sh
#
# DEPENDENCIES:
# colors.sh (must be sourced)
# 
# USAGE:
#
# . custom-prompt.sh <path_to_python_script_dir>
# See each function for specific usage
#
MAKE_PROMPT=$1/prompt.py

smiley() {
	ERROR=$?
	if [ $ERROR -eq 0 ]
	then 
		colorEcho $GREEN ":)"
	else 
		colorEcho $RED ":( $ERROR"
	fi
	unset ERROR
}

# Angle-shaped prompt in three colors
# Format:
# <user@host:/current/directory>
# Usage:
# anglePrompt COLOR1 COLOR2 COLOR3
anglePrompt() {
	PS1=$($MAKE_PROMPT '|1|<|2|:user:|1|@:host::|3|:cwd:|1|>' ${1:-red} ${2:-cyan} ${3:-yellow})
}

#alias for anglePrompt for backwards compatibility
#in version 1.1. Will be removed in version 2.0
#Deprecated, use anglePrompt instead.
drexelPrompt() {
	anglePrompt
}

# Single color prompt
# Format:
# user@host /current/directory >
# Usage:
# colorPrompt COLOR
colorPrompt() {	
	PS1=$($MAKE_PROMPT '|1|:user:@:host: :cwd: >' ${1:-red})
	#PS1="\[$1\]\u@\h \w >\[$NORMAL\]"
}

# Three-color prompt
# Format:
# user@host /current/directory $>
# Usage:
# triColorPrompt COLOR1 COLOR2 COLOR3
triColorPrompt() {
	PS1=$($MAKE_PROMPT '|1|:user:@:host: |2|:cwd: |3|:sigil>' ${1:-red} ${2:-green} ${3:-blue})
}

# LISP-like prompt
# Format:
# (user host /current/directory)
# >
# Usage:
# lispPrompt color1 color2
lispPrompt() {
	PS1=$($MAKE_PROMPT '|1|(:user: :host: :cwd:)\n|2|>' ${1:-yellow} ${2:-cyan})
}

# Fun two-line prompt including a smiley indicating
# sucess of the last status
# Format:
# [user@host]-[/current/directory]-[:)]
# -->
# Usage:
# bracketPrompt address_color cwd_color bracket_color
bracketPrompt() {
	export PS1=$($MAKE_PROMPT '|3|[|1|:user:@:host:|3|]-[|2|:cwd:|3|]-[$(smiley)|3|]\n|3|-->' ${1:-yellow} ${2:-cyan} ${3:-white})
}
