#!/usr/bin/env python
import sys
import re

escape='\033[{}m'
colors8 = {
	'black': escape.format(30),
	'red': escape.format(31),
	'green': escape.format(32),
	'yellow': escape.format(33),
	'blue': escape.format(34),
	'magenta': escape.format(35),
	'cyan': escape.format(36),
	'white': escape.format(37)
}

if __name__ == '__main__':
	prompt = sys.argv[1]
	colors = sys.argv[2:]

	colors = [colors8.get(color, '') for color in colors]

	for i, color in enumerate(colors):
		placeholder = '\{{{}\}}'.format(i + 1)
		prompt = re.sub(placeholder, color, prompt)

	prompt = re.sub('\{0\}', escape.format(0), prompt)

	print prompt
