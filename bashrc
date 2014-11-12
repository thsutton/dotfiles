# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# My locale
if [ -z "$TZ" ]; then
    export TZ="Australia/Sydney"
fi
if [ -z "$LANG" ]; then
    export LANG="en_AU.UTF-8"
fi

# Editor
case "$TERM" in
    xterm*|rxvt*)
        EDITOR="gvim --nofork"
        ;;
    *)
        EDITOR=vim
        ;;
esac
export EDITOR

shopt -s checkwinsize

# History
shopt -s histappend
HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
HISTTIMEFORMAT='%F %T'

[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# OPAM
[ -d "$HOME/.opam" ] && source "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null

# Extend $PATH
# [ -d "/usr/local/ghc-head/bin" ] && PATH="/usr/local/ghc-head/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

export PATH

export PS1='[\u@\h \W]\$ '
