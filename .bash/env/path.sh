for dir in /opt/*/bin; do
    if [ "$dir" != "/opt/local/bin" ]; then
        pathmunge "$dir"
    fi
done

pathmunge "/Applications/MAMP/Library/bin"
pathmunge "/opt/local/bin"
pathmunge "/usr/local/bin" "move"
pathmunge "$HOME/bin"

export PATH
