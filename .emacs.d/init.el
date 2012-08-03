(add-to-list 'load-path "~/.emacs.d")
(load "helper.el")
(add-to-load-path-and-next-level "~/.emacs.d/vendor")

; turn off tool bar and menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

(savehist-mode 1)

(global-font-lock-mode 1)
(set-default-font "-*-terminus-medium-*-*-*-14-*-*-*-*-*-*-*")

(setq column-number-mode t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-c\C-s" 'sort-lines)

(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

(require 'tramp)

(require 'xml-pretty)
(global-set-key "\C-c\C-p" 'xml-pretty)

(load "javascript.el")
(load "python-mode-add.el")
(load "ruby")
(load "theme")

(load "git-commit-mode/git-commit")

(load "robmyers-scripts/artbollocks-mode")
(add-hook 'text-mode-hook 'turn-on-artbollocks-mode)

(server-start)
