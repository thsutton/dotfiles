for dir in /opt/*/bin; do
    export PATH="$dir:$PATH"
done;

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
