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

# Perl
if [ -d "$HOME/perl5" ]; then
    PATH="$HOME/perl5/bin${PATH+:}${PATH}"

    PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
    PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
    PERL_MB_OPT="--install_base \"$HOME/perl5\""
    PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

    export PATH PERL5LIB PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT
fi

# Extend $PATH
# [ -d "/usr/local/ghc-head/bin" ] && PATH="/usr/local/ghc-head/bin:$PATH"
[ -d "/usr/local/ghc-7.8.4/bin" ] && PATH="/usr/local/ghc-7.8.4/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

export PATH

export PS1='[\u@\h \W]\$ '
