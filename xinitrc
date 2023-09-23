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


if [ -x "$(which xrdb)" ]; then
[ -r "/etc/X11/xinit/.Xresources" ] && xrdb -merge "/etc/X11/xinit/.Xresources"
[ -r "/usr/local/etc/X11/xinit/.Xresources" ] && xrdb -merge "/usr/local/etc/X11/xinit/.Xresources"
[ -r "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"
fi

if [ -x "$(which xmodmap)" ]; then
[ -r "/etc/X11/xinit/.Xmodmap" ] && xrdb -merge "/etc/X11/xinit/.Xmodmap"
[ -r "/usr/local/etc/X11/xinit/.Xmodmap" ] && xrdb -merge "/usr/local/etc/X11/xinit/.Xmodmap"
[ -r "$HOME/.Xmodmap" ] && xrdb -merge "$HOME/.Xmodmap"
fi

if [ -x "$(which fcitx5)" ]; then
        export XMODIFIERS="@im=fcitx"
        export GTK_IM_MODULE="fcitx/xim"
        export QT_IM_MODULE="fcitx"
        fcitx5 -d
fi

run() {
        if [ -x "$(which $1)" ]; then
                $* &
        else
                echo "xinit: Not found: $1" > /dev/stderr
        fi
}

run xscreensaver --no-splash &

run srandrd "$HOME/.config/srandrd/script.sh"

run sctd --latitude -33.868820 --longitude 151.209290

run picom --vsync --backend glx --no-fading-openclose

[ -x "$(which feh)" -a -x "$HOME/.config/fehbg" ] && . "$HOME/.config/fehbg"

exec awesome
