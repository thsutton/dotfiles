#!/usr/bin/env bash
#
# Functions for manipulating $PATH style strings.
#

# Remove an item from a path
#
# $1 is the $PATH-like string
# $2 is the item to delete
pathdelete () {
    path="$1"
    component="$2"
    path=$(echo "$path" | sed -Ee "s#(^|:)$component($|:)#\2#g")
    echo $path
}

# Add (or move, or ...) a directory to the $PATH
#
# Arguments $2 and $3 are optional and can be "after" to append the
# item to the $PATH (vs prepend) or "move" to remove the item if it
# exists and add it to the front/end.
#
# $1 is the item to add, etc.
# $2 is, optionally, "after" or "move"
# $3 is, optionally, "after" or "move"
pathmunge () {
    if [ -d "$1" ] ; then 
        if echo $PATH | egrep -qv "(^|:)$1($|:)" ; then
            if [ "$2" = "after" -o "$3" = "after" ] ; then
                PATH="$PATH:$1"
            else
                PATH="$1:$PATH"
            fi
        elif [ "$2" = "move" -o "$3" = "move" ]; then
            PATH=`pathdelete "$PATH" "$1"`
            if [ "$2" = "after" -o "$3" = "after" ]; then
                PATH="$PATH:$1"
            else
                PATH="$1:$PATH"
            fi
        fi
    fi
}
