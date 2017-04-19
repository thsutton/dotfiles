# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# Include library functions
for file in $HOME/.bash/lib/*.sh; do
    [ -x "$file" ] && source "$file"
done

# Include my environment
for file in $HOME/.bash/env/*.sh; do
    [ -x "$file" ] && source "$file"
done

# Include my completions
for file in $HOME/.bash/completion/*.sh; do
    [ -x "$file" ] && source "$file"
done

