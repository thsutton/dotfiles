for dir in /opt/*/bin; do
    if [ "$dir" != "/opt/local/bin" ]; then
        pathmunge "$dir"
    fi
done

pathmunge "/opt/local/bin"
pathmunge "/usr/local/bin" "move"
pathmunge "/Applications/MAMP/Library/bin" "move"
pathmunge "$HOME/Library/Haskell/bin"
pathmunge "$HOME/Library/bin"
pathmunge "$HOME/bin"
pathmunge "$HOME/Library/bin"

export PATH
