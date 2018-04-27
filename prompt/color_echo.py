#!/usr/bin/env python
"""
Little Python script for echoing in a color
"""
from __future__ import print_function
import argparse
from prompt import parse_color

# No need for escaped brackets outside of a bash PS1
ESCAPE = '\033[{}m'
NORMAL = ESCAPE.format(0)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('color', help='Color to print in')
    parser.add_argument('text', nargs='+', help='text to print in color')
    args = parser.parse_args() 

    color = parse_color(args.color)
    esc_color = ESCAPE.format(color)
    text = " ".join(args.text)
    print("{}{}{}".format(esc_color, text, NORMAL))
