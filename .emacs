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

(defun xml-pretty ()
  "make current buffer pretty if in sgml mode"
  (interactive)
  (when (eq major-mode 'sgml-mode)
    (sgml-pretty-print (point-min) (point-max))))

(global-set-key "\C-c\C-p" 'xml-pretty)

(global-set-key "\C-c\C-s" 'sort-lines)
