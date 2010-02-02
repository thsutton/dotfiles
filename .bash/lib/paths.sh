#!/usr/bin/env bash
#
# Functions for manipulating $PATH style strings.
#
pathmunge () {
    if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
        if [ -d "$1" ] ; then 
            if [ "$2" = "after" ] ; then
                PATH="$PATH:$1"
            else
                PATH="$1:$PATH"
            fi
        fi
    fi
}
