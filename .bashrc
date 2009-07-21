find $HOME/.bash/env -type f -executable | while read file; do
    source $file
done

find $HOME/.bash/completion -type f -executable | while read file; do
    source $file
done

eval "`dircolors -b`"
alias ls="ls --color=auto"
