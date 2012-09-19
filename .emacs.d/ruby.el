; ruby files not ending in .rb that ruby mode should be used for
(dolist (pattern (list
		  "Capfile\\'"
		  "capfile\\'"
		  "config\\.ru\\'"
		  "Rakefile\\'"
		  "\\.rake\\'"
		  )) (add-to-list 'auto-mode-alist (cons pattern 'ruby-mode)))
