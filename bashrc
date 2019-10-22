# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# Include library functions
for file in $(find $HOME/.bash/lib -type f -name '*.sh' -perm -100); do
    source "$file"
done

# Include my environment
for file in $(find $HOME/.bash/env -type f -name '*.sh' -perm -100); do
    source "$file"
done

# Include my completions
for file in $(find $HOME/.bash/completion -type f -name '*.sh' -perm -100); do
    source "$file"
done
