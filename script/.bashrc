# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.aliases ]; then
        . ~/.aliases
fi

LS_COLORS=$LS_COLORS:'ow=1;34:';
export LS_COLORS

source ~/.terminal-config/git-prompt.sh
source ~/.terminal-config/git-completion.bash

# Define some colors for the terminal to use
blue="\[\033[0;34m\]"
gray="\[\033[38;5;209m\]"
pink="\[\033[38;5;211m\]"
green="\[\033[38;5;40m\]"
reset="\[\033[0m\]"
orange="\[\033[32m\]"
red="\[\033[36m\]"
yellow="\[\033[38;5;204m\]"
blue="\[\033[38;5;33m\]"
purple="\[\033[38;5;171m\]"
lblue="\[\033[38;5;63m\]"

export GIT_PS1_SHOWDIRTYSTATE=1

export PS1="$lblue┌──$red(\u$lblue@$red\h) $gray[\w]$pink\$(__git_ps1)\n$lblue└──$purple[\D{%H:%M:%S}]$lblue─$purple[\$(du -sh |awk '{print \$1}')]$lblue $ $reset"

#One-liner code to see all the possible 255 colors on screen
#for COLOR in {1..255}; do echo -en "\e[38;5;${COLOR}m${COLOR} "; done; echo;
