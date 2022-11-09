# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

LS_COLORS=$LS_COLORS:'ow=1;34:';
export LS_COLORS

source ~/.terminal-config/git-prompt.sh
source ~/.terminal-config/git-completion.bash

# Define some colors for the terminal to use
blue="\[\033[0;34m\]"
gray="\[\033[38;5;246m\]"
pink="\[\033[38;5;211m\]"
green="\[\033[38;5;40m\]"
reset="\[\033[0m\]"
orange="\[\033[33m\]"
red="\[\033[31m\]"

export GIT_PS1_SHOWDIRTYSTATE=1

export PS1="$red\u $red@ $orange\h$pink\$(__git_ps1) $gray\W $ $reset"
#cd "/mnt/c/Users/Haresh Bhuriya/Documents"
