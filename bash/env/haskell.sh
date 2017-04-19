#!/bin/bash

if type -t hoogle > /dev/null 2>&1; then
  echo > /dev/null
else
  function hoogle() {
    open "https://haskell.org/hoogle/?hoogle=$*"
  }
fi
