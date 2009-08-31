# Set the prompt
export PS1="\u@\h:\W\$ "

# Include my environment
for file in $HOME/.bash/env/*.sh; do
    [ -x "$file" ] && source $file
done

# Include my completions
for file in $HOME/.bash/completion/*.sh; do
    [ -x "$file" ] && source $file
done

# Extend paths
if [ -d "/opt/bin" ]; then
    export PATH="/opt/bin:$PATH"
fi
if [ -d "/opt/local/bin" ]; then
    export PATH="/opt/local/bin:$PATH"
fi
if [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:$PATH"
fi
if [ -d "/usr/local/mysql/bin" ]; then
    export PATH="/usr/local/mysql/bin:$PATH"
fi
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
