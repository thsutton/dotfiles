#!/bin/sh
#
# Initialise this directory for real xmonad.
#

cabal update
cabal unpack xmonad
cabal sandbox init
cabal sandbox add-source xmonad-*

cabal install xmonad xmonad-contrib xmobar
