import XMonad
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig
import XMonad.Util.Run

main = do
  xmonad $ defaultConfig {
    modMask = mod4Mask,
    terminal = "urxvt"
  } `additionalKeysP` [
      ("M-u", safeSpawnProg "clip2browser"),
      ("M-g", safeSpawnProg "clip2google"),
      ("M-x", safeSpawnProg "xlock")
    ]
