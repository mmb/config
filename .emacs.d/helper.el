(require 'cl)

; join two path elements
(defun path-join (a b) (concat a "/" b))

; return a list of the full paths of a directory and all directories one level
; below it
(defun path-and-next-level (path)
  (cons path
	(mapcar
	 (lambda (f) (path-join path f))
	 (remove-if
	  (lambda (x) (or (string= x ".") (string= x "..")))
	  (directory-files path)))))

; add a directory and all directories one level below it to the load path
(defun add-to-load-path-and-next-level (path)
  (dolist
      (dir
       (path-and-next-level path))
    (add-to-list 'load-path dir)))
