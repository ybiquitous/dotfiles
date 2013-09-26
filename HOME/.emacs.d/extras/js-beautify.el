;; by koba on 2013-09-26
;; required: sudo npm install -g js-beautify

(defun js-beautify-command ()
  (message "js-beautify -s %d -f %s" js-indent-level buffer-file-name))

(defun js-beautify ()
  (interactive)
  (save-buffer)
  (erase-buffer)
  (insert (shell-command-to-string (js-beautify-command))))

(provide 'js-beautify)
