for dir in /opt/*/bin; do
    if [ "$dir" != "/opt/local/bin" ]; then
        pathmunge "$dir"
    fi
done

pathmunge "/Applications/MAMP/Library/bin"
pathmunge "/opt/local/bin"
pathmunge "/usr/local/bin"
pathmunge "$HOME/.gem/ruby/1.8/bin"
pathmunge "$HOME/bin"

export PATH
