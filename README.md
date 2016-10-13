# Linux Login
Some handy scripts for Bash shell customization.

##Features:
- colored terminal prompts
- useful aliases 
- sample .vimrc
- bonus util functions

##Installation:
1. Clone the repository
2. Make sure all .sh files have execute permissions set
3. Add the following lines to your .bashrc
  ```	
  source [path/to/repo/]linux-login/login.sh  #Add everything in this repo to your 
                                              #environment
  [prompt-command]                            #Set a customized PS1
  ```
  See [Prompts](#prompts) below for more information about the provided prompts.

4. (Optional) copy all the files in `dotfiles/` to `~` if you would like to use some of my config files.

##Prompts

This repository now includes a Python script, `prompt/prompt.py`. This makes it easy to format a Bash prompt with colors.

To make it even easier, the function `setPrompt` was added to simplify the Bash syntax

###Basic Usage

The basic usage for `prompt.py` is as follows:

```
PS1=$(prompt.py [Format String] [color1 [color2 [color3 ...]]])
```

setPrompt makes this even nicer:

```
setPrompt [Format String] [color1 [color2 [color3 ...]]]
```

###Format Strings
A format string is any text with some special character sequences that will be used for substituting bash variables like `\u` (username) or `\w` (current working directory), as well as for setting colors.

To make a simple prompt in the default color (like this: `user@host ~/path/to/current/dir $>`), you would do something like this:

```
setPrompt ':user:@:host: :cwd: :sigil:>'
```

Current list of variables (subject to change):

Variable | Bash Equivalent | Description
---------|-----------------|------------
:user:     | \u  | username
:host:     | \h  | shortened hostname (computer name)
:hostname: | \H  | full hostname (computer name)
:cwd:      | \w  | current working directory
:cwdbase:  | \W  | basename of CWD
:sigil:    | \$  | $ for user, # for root
:jobs:     | \j  | number of background jobs
:tty:      | \l  | basename of terminal device name
:shell : (without the space)    | \s  | name of shell
:time24:   | \t  | 24 hour time, HH:MM:SS
:time12:   | \T  | 12 hour time, HH:MM:SS
:time:     | \@  | 12 hour time with AM/PM
:version:  | \v  | Bash version number
:release:  | \V  | Bash release number
:history:  | `\!`  | history number
:command:  | `\#` | command number

####Color

You can also color your prompt. `|0|` marks the default color, `|1|` marks color1, `|2|` marks color2, etc. if |0| is not specified at the end, prompt.py will add it to prevent the color from bleeding onto any text you type after it.

For example, a three color prompt might be specified like this:

```
setPrompt '|1|:user:|0|@|2|:host: |3|:cwd: :sigil:>' red green blue
```

This would print the username in blue, the `@` in the default color, the hostname in green, and the current working directory and sigil in blue. 

Colors can be one of the default 8 colors (`red green blue cyan yellow magenta black white`) or a number from 0 to 255 to
use 256 color mode. all others will be ignored. To see a list of all colors, type `list_colors`

`bold` and `underline` can be specified for the basic 8 colors with a semicolon in between. 

e.g.:

```
setPrompt '|1|:sigil:>' 'bold;red'
```

#### Pre-Made Prompts

I made a few prompts. These can be used in a bashrc directly:

|Prompt Command|Args|
|--------------|----|
|anglePrompt|color1 color2 color3
|colorPrompt|color
|triColorPrompt|color1 color2 color3
|lispPrompt|color1 color2
|bracketPrompt|color1 color2 color3

Some of these were inspired by [this page](https://www.maketecheasier.com/8-useful-and-interesting-bash-prompts/)

#### Adding Bash Commands to the Prompt

If you specify a command inside `$()`, it will be used in the PS1 unaltered.

e.g.:

```
setPrompt ':user:@:host: $(date +%s) :cwd:>'
```

(displays a Unix timestamp of the current time in the prompt)

#### Error Handling

Since this command is designed to be used in a prompt, all error handling is done silently. If the user enters an invalid color, the `|#|` for that number will be replaced by an empty string.

If the user specifies too few colors, subsequent colors will not be replaced. for example:

```
setPrompt '|1|Hello |2|World` blue
```

Will return `Hello |2|World` in blue.

A similar thing happens for variable substitution. non-variables between colons will be ignored.

e.g.: `setPrompt ':user:@:host: :invalid: >` would become something like `ptrgags@ubuntu :invalid: >`


## Aliases

I included a number of useful aliases in this project. It is by no means an exhaustive list of aliases, but it's a nice set for getting started. See `source/aliases.sh` for the full list.

## Bonus Features

### Status Code Smiley

For one of the prompts, I made a status code smiley that takes the output of the last command and displays either a green smiley for success or a frown + error code for failure. The smiley idea was inspired by #1 on [this page](https://www.maketecheasier.com/8-useful-and-interesting-bash-prompts/). It can be embedded in the prompt:

```
setPrompt ':user:@:host: :cwd: $(smiley)>'
```

or it can be run by itself:

`smiley`

### `color_echo`

You can also print in color with the underlying Python code for coloring the
prompt:

```
color_echo <color> <text>
```

Colors are the same as for `setPrompt`.
