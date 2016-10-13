#
# Bash Utility Functions
#
# This file is sourced from login-source.sh
#


# Use this when you need to do math in a hurry
function pymath {
    python -c "print $1"
}

# Serve static files on a given port
function serve_static {
    python -m SimpleHTTPServer $1
}

# Activate a virtualenv located in ~/venv/<env_name>
function venv {
    source ~/venv/$1/bin/activate
}

# List file descriptors for a pgrep -f call for the current user.
function fds {
    ls -l /proc/$(pgrep -u $USER -f $1 | head -1)/fd
}

# Grep for todos
function todogrep {
    egrep -r 'TODO|FIXME|XXX|HACK' .
}

# Echo in color
function color_echo {
    color_echo.py $1 ${@:2}
}

# List all the 256 color codes.
# It makes a nice rainbow affect down the
# terminal!
function list_colors {
    for i in $(seq 0 255)
    do
        color_echo.py $i $i
    done
}
