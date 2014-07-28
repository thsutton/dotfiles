module Main where

import XMonad
import XMonad.Config.Gnome

main :: IO ()
main = xmonad $ gnomeConfig

