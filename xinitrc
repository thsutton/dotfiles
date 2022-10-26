#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && source "$f"
  done
fi

[ -n "$(which ginn 2> /dev/null)" ] && ginn $HOME/.wishes.xml &

[ -n "$(which feh 2> /dev/null)" ] && eval $(cat ~/.fehbg)

exec xmonad
