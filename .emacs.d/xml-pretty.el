(defun xml-pretty ()
  "make current buffer pretty if in sgml mode"
  (interactive)
  (when (eq major-mode 'sgml-mode)
    (sgml-pretty-print (point-min) (point-max))))

(provide 'xml-pretty)
