(add-to-list 'load-path "~/.emacs.d")

; turn off tool bar and menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-font-lock-mode 1)

(require 'color-theme)
(require 'color-theme-tango)
(color-theme-tango)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-c\C-s" 'sort-lines)

(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

(require 'xml-pretty)
(global-set-key "\C-c\C-p" 'xml-pretty)

(load "python-mode-add.el")

(server-start)
