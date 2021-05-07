#!/usr/bin/fish

# TODO Think of better shell greeting
set fish_greeting # Disable shell greeting

set -l config_dir (dirname (status --current-filename))

# Load environment variables
if test -z "$__backpack_env"
	source $config_dir/env.fish
end

# If this is an interactive shell
if status --is-interactive
	# Do some stuff
end
