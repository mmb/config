; turn off tool bar and menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-font-lock-mode 1)

(require 'color-theme)

(add-to-list 'load-path "/home/mmb/src/el/")
(load "color-theme-tango.el")
(color-theme-tango)

;; org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
