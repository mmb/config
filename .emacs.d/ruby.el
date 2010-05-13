; ruby files not ending in .rb that ruby mode should be used for
(dolist (pattern (list
		  "config\\.ru\\'"
		  "Rakefile\\'"
		  )) (add-to-list 'auto-mode-alist (cons pattern 'ruby-mode)))
