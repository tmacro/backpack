#
# Place environment variables here
#

# Set some standard vars
set -x VISUAL nano
set -x EDITOR $VISUAL
set -x SHELL /usr/bin/fish

# User scripts in ~/.bin
set -x PATH $PATH $HOME/.bin

# Locally compiled binaries in ~/.local/bin
set -x PATH $PATH $HOME/.local/bin

# Set sentinel
set -x $__backpack_env "1"