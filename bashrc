# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# My locale
[ -z "$TZ" ] && export TZ="Australia/Sydney"
[ -z "$LANG" ] && export LANG="en_AU.UTF-8"

# Editor
if [ -z "$(which gvim)" ]; then
    EDITOR=vim
else
    EDITOR="gvim -f"
fi
export EDITOR

shopt -s checkwinsize

# History
shopt -s histappend
HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
HISTTIMEFORMAT='%F %T'

[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

function extend_path () {
    [ -d "$1" ] && export PATH="$1:$PATH"
}

[ -d "$HOME/.opam" ] && source "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null

extend_path "/usr/local/git-2.4.4/bin"
extend_path "/usr/local/ghc-7.8.4/bin"

extend_path "/Applications/Postgres.app/Contents/Versions/9.4/bin"

extend_path "$HOME/.smackage/bin"

extend_path "$HOME/Library/bin"
extend_path "$HOME/bin"

export PATH

export PS1='[\u@\h \W]\$ '
