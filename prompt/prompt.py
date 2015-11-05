#!/usr/bin/env python
import sys
import re

#Escape code for a color
escape='\[\033[{}m\]'

#Special effects
effects = {
	'normal': '0',
	'bold': '1',
	'underline': '4'
}

#8-color mode colors
colors8 = {
	'black': '30',
	'red': '31',
	'green': '32',
	'yellow': '33',
	'blue': '34',
	'magenta': '35',
	'cyan': '36',
	'white': '37'
}

#Special Bash PS1 variables
bash_vars = {
	':date:': '\d',
	':host:': '\h',
	':hostname:': '\H',
	':jobs:': '\j',
	':tty:': '\l',
	':shell:': '\s',
	':time24:': '\\t',
	':time12:': '\T',
	':time:': '\@',
	':user:': '\u',
	':version:': '\\v',
	':release:': '\V',
	':cwd:': '\w',
	':cwdbase:': '\W',
	':history:': '\!',
	':command:': '\#',
	':sigil:': '\$'
}

def parse_color(color):
	parts = color.split(';')
	results = []
	for color in parts:
		try:
			colorNum = int(color)
			results.append('38;5;{}'.format(colorNum))
		except ValueError:
			if color in colors8:
				results.append(colors8[color])
			elif color in effects:
				results.append(effects[color])
	return ';'.join(results)
			

if __name__ == '__main__':
	prompt = sys.argv[1]

	#Ensure we clear the color at the end of the prompt
	if not prompt.endswith('|0|'):
		prompt += '|0|'

	colors = sys.argv[2:]

	#Replace :<var_name>: with the corresponding bash escape character
	for key in bash_vars:
		if key in prompt:
			prompt = prompt.replace(key, bash_vars[key])

	#Get a list of colors the user specifies
	colors = [parse_color(color) for color in colors]

	#Replace all the colors with their color codes
	for i, color in enumerate(colors):
		placeholder = '|{}|'.format(i + 1)
		colorcode = escape.format(color)
		prompt = prompt.replace(placeholder, colorcode)


	#Replace all
	prompt = prompt.replace('|0|', escape.format(0))

	print prompt
