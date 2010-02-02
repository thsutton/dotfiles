if [ "`id -u`" -eq 0 ] ; then

for dir in /opt/*/sbin; do
    if [ "$dir" != "/opt/local/sbin" ]; then
        pathmunge "$dir"
    fi
done

pathmunge "/opt/local/sbin"
pathmunge "/usr/local/sbin"
pathmunge "$HOME/sbin"

export PATH

fi
