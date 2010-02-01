VIM=`which vim`
if [ -n "$VIM" ]; then
    export EDITOR=vim
else
    export EDITOR=emacs
fi
