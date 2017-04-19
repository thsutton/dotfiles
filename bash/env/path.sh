for dir in /opt/*/bin; do
    pathmunge "$dir"
done

pathmunge "/opt/local/bin" "move"
pathmunge "/usr/local/bin" "move"
pathmunge "$HOME/Library/Haskell/bin" "move"
pathmunge "$HOME/Library/bin"
pathmunge "$HOME/Library/bin"
pathmunge "$HOME/bin"

export PATH
