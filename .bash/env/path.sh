for dir in /opt/*/bin; do
    if [ "$dir" != "/opt/local/bin" ]; then
        pathmunge "$dir"
    fi
done

pathmunge "/opt/local/bin"
pathmunge "/usr/local/bin"
pathmunge "$HOME/bin"

export PATH
