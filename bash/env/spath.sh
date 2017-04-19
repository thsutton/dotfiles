if [ "`id -u`" -eq 0 ] ; then

    for dir in /opt/*/sbin; do
        pathmunge "$dir"
    done

    pathmunge "/opt/local/sbin" "move"
    pathmunge "/usr/local/sbin"
    pathmunge "$HOME/sbin"

    export PATH

fi
