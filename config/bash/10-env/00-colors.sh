if [ -x "$(which dircolors)" ]; then
    eval "$(dircolors -b)"
    alias ls="ls -AFG --color=auto"
else
    alias ls="ls -AFG"
fi
