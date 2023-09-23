if [ $(id -u) -eq 0 ] ; then
    pathmunge "/opt/local/sbin" "move"

    for dir in /opt/*/sbin; do
        pathmunge "$dir"
    done

    pathmunge "/usr/local/sbin"
    pathmunge "$HOME/sbin"
fi
