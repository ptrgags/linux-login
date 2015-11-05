#!/usr/bin/env python
import sys
import re

#Escape code for a color
escape='\[\033[{}m\]'
normal=escape.format(0)

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

def build_prompt(prompt):
	'''
	Subsitute variables like :user: and
	:host: with their bash variables
	(ex. \u or \h)

	prompt -- the original prompt

	returns the prompt with substitutions made
	'''
	for key in bash_vars:
		if key in prompt:
			prompt = prompt.replace(key, bash_vars[key])
	return prompt

def color_prompt(prompt, colors):
	'''
	color the prompt, replacing
	|1|, |2|, ... with entries
	from colors and 
	|0| with the code for normal color
	
	prompt -- the prompt with 
	colors -- the list of colors 
	'''

	#Ensure we clear the color at the end of the prompt
	if not prompt.endswith('|0|'):
		prompt += '|0|'
	
	#Get a list of colors the user specifies
	colors = [parse_color(color) for color in colors]

	#Replace all the colors with their color codes
	for i, color in enumerate(colors):
		placeholder = '|{}|'.format(i + 1)
		colorcode = escape.format(color)
		prompt = prompt.replace(placeholder, colorcode)

	#Replace all normal colors with the 'normal' code
	prompt = prompt.replace('|0|', normal)
	
	return prompt

if __name__ == '__main__':
	try:
		prompt = sys.argv[1]
		colors = sys.argv[2:]
	except IndexError:
		sys.exit(1)

	prompt = build_prompt(prompt)
	prompt = color_prompt(prompt, colors)

	print prompt
