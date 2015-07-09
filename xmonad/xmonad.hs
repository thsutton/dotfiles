module Main where

import XMonad
import XMonad.Hooks.DynamicLog

main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
    { terminal = "urxvt"
    , modMask = mod4Mask
    }

