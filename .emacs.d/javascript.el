(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

; Indent with spaces instead of tabs.
(add-hook 'js-mode-hook 'my-disable-indent-tabs-mode)
(defun my-disable-indent-tabs-mode ()
  (set-variable 'indent-tabs-mode nil))
