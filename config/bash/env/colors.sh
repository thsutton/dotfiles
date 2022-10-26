cancolor=`which dircolors`
if [ -n "$cancolor" ]; then
    eval "`dircolors -b`"
    alias ls="ls -AF --color=auto"
else
    alias ls="ls -AFG"
fi
