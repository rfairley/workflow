# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
PATH="$HOME/rfairley-installs/minishift-1.27.0-linux-amd64:$PATH"
PATH="$HOME/rfairley-installs/openshift-origin-server-v3.9.0-191fece-linux-64bit:$PATH"
PATH="$HOME/rfairley-scripts:$PATH"

export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias la="ls -a"
alias ll="ls -alZ"
alias lh="ls -lh"
