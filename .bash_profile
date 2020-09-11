# don't start X server if connect through SSH
if ([ ! -n "$SSH_TTY" ] || [ ! -n "$SSH_CLIENT" ]) && [ ! -n "$TMUX" ]; then
	exec startx
else
#	export TERM=screen-256color
	source ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
