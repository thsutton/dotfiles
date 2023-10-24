#!/bin/sh
set -eu

# Disable bell
xset -b

# Load system xinitrc files.
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
fi

if [ -d /usr/local/etc/X11/xinit/xinitrc.d ] ; then
    for f in /usr/local/etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
fi
unset f


with() {
    file="$1"
    shift
    if [ -r "$file" ]; then
        $* "$file"
    else
        echo "xinitrc: Not found input for $* $file" > /dev/stderr
    fi
}

run() {
        if [ -x "$(which $1 2>/dev/null)" ]; then
                $* &
        else
                echo "xinitrc: Not found: $1" > /dev/stderr
        fi
}

if [ -x "$(which xrdb 2>/dev/null)" ]; then
    with /etc/X11/xinit/.XResources xrdb -merge
    with /usr/local/etc/X11/xinit/.XResources xrdb -merge
    with "$HOME/.Xdefaults" xrdb -merge
    with "$HOME/.XResources" xrdb -merge
fi

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
