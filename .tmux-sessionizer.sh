#!/bin/bash

# if one argument select it
if [[ $# -eq 1 ]]; then
	selected=$1
else
	exit 1 # he uses a $(find ~/repos -mindepth 1 -maxdepth 1 -type d | fzf) here but i dont need it
fi

# if selected is zero length then quit
if [[ -z $selected ]]; then
	exit 1
fi

# grab only the name after ~/repos for the tmux session name
sname=$(basename "$selected" | tr . _)

tmux_pid=$(pgrep tmux)

# if im currently inside a tmux session and no tmux pid, create a new session
if [[ -z $TMUX ]] && [[ -z $tmux_pid ]]; then
	tmux new-session -s $sname -c $selected
	exit 0
fi

# if tmux does not have a session with this name already
# create new detached session with the name
if ! tmux has-session -t=test 2> /dev/null; then
	tmux new-session -ds $sname -c $selected
fi

tmux switch-client -t $sname
