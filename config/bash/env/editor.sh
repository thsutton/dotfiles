if [ -n "$(which nvim)" ]; then
    EDITOR=nvim
elif [ -n "$(which gvim)" -a -n "$DISPLAY" ]; then
    EDITOR="gvim -f"
else
    EDITOR=vim
fi
export EDITOR
