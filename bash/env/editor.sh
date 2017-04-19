# Editor
if [ -z "$(which gvim)" ]; then
    EDITOR=vim
else
    EDITOR="gvim -f"
fi
export EDITOR
