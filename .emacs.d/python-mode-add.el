; python mode additions

; automatically indent after newline
(add-hook 'python-mode-hook '(lambda ()
			       (define-key python-mode-map "\C-m" 'newline-and-indent)))
