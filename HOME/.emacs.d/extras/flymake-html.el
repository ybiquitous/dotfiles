;;
;; Flymake HTML
;;
;; http://www.emacswiki.org/emacs/FlymakeHtml
;;

(require 'flymake-easy)

(defconst flymake-html-err-line-patterns
  '(("line \\([0-9]+\\) column \\([0-9]+\\) - \\(Warning\\|Error\\): \\(.*\\)" nil 1 2 4)))

(defun flymake-html-command (filename)
  (list "tidy" "-utf8" filename))

(defun flymake-html-load ()
  (interactive)
  (flymake-easy-load 'flymake-html-command
                     flymake-html-err-line-patterns
                     'tempdir
                     "html"))

(provide 'flymake-html)
