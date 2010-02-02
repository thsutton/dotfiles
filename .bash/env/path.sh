for dir in /opt/*/bin; do
    if [ -d "$dir" -a "$dir" != "/opt/local/bin" ]; then
        export PATH="$dir:$PATH"
    fi
done

if [ -d "/opt/local/bin" ]; then
    export PATH="/opt/local/bin:$PATH"
fi

if [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
