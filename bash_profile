#
# ~/.bash_profile
#

[[ -r ~/.bashrc ]] && . ~/.bashrc

for file in $(find -s "$HOME/.config/bash" -type f -name '*.sh' -perm +111); do
    . "$file"
done
