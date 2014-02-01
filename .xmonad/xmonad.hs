import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "i3status | xmobar -b -t '%StdinReader%' -c '[Run StdinReader]'"

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

myConfig = defaultConfig {
  modMask = mod4Mask,
  terminal = "urxvt"
}
