#!/bin/sh
set -eu

# Disable bell
xset -b

# Load system xinitrc files.
for d in {,/usr/local}/etc/X11/xinit/xinitrc.d; do
    if [ -d "$d" ]; then
        for f in "$d"/?*.sh; do
            [ -x "$f" ] && . "$f"
        done
    fi
done

unset d f

load() {
    eval file=\${$#}
    [ -x "$(which $1)" -a -r "$file" ] && $* || echo "$1: cannot load $file"
}

run() {
        if [ -x "$(which $1 2>/dev/null)" ]; then
                $* &
        else
                echo "xinitrc: Not found: $1" > /dev/stderr
        fi
}

load modmap "/etc/X11/xinit/.Xmodmap"
load modmap "/usr/local/etc/X11/xinit/.Xmodmap"
load modmap "$HOME/.Xmodmap"

load xrdb -merge /etc/X11/xinit/.XResources
load xrdb -merge /usr/local/etc/X11/xinit/.XResources
load xrdb -merge "$HOME/.Xdefaults"
load xrdb -merge "$HOME/.XResources"

if [ -x "$(which fcitx5 2>/dev/null)" ]; then
    export XMODIFIERS="@im=fcitx"
    export GTK_IM_MODULE="fcitx/xim"
    export QT_IM_MODULE="fcitx"
    fcitx5 -d
fi

run xscreensaver --no-splash

run srandrd "$HOME/.config/srandrd/script.sh"

run sctd --latitude -33.868820 --longitude 151.209290

run picom --vsync --backend glx --no-fading-openclose

exec awesome
