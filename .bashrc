

# Include my environment
for file in $HOME/.bash/env/*.sh; do
    source $file
done

# Include my completions
for file in $HOME/.bash/completion/*.sh; do
    source $file
done

# Add ~/bin to path
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

# Set the prompt
export PS1="\u@\h:\W\$ "

# Use colourful listings
eval "`dircolors -b`"
alias ls="ls --color=auto"
