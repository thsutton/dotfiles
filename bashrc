# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"
