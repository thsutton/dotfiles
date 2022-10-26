#
# ~/.bash_profile
#

[[ -r ~/.bashrc ]] && . ~/.bashrc

for file in $(find "$HOME/.config/bash/lib" -type f -name '*.sh' -perm -100); do
    . "$file"
done

for file in $(find "$HOME/.config/bash/env" -type f -name '*.sh' -perm -100); do
    . "$file"
done

for file in $(find "$HOME/.config/bash/completion" -type f -name '*.sh' -perm -100); do
    . "$file"
done
