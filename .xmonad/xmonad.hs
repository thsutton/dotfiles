import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
	xmproc <- spawnPipe "/usr/bin/xmobar /home/thsutton/.xmobarrc"
	xmonad $ defaultConfig 
		{ focusFollowsMouse = False
		, terminal = "urxvt +sb"
		, manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts $ layoutHook defaultConfig
		, logHook = dynamicLogWithPP $ xmobarPP
			{ ppOutput = hPutStrLn xmproc
			, ppTitle = xmobarColor "green" "" . shorten 50
			}
		, modMask = mod4Mask -- Rebind Mod to the Windows key
		--, borderWidth = 1
		} 
