;; flycheck-jscs
(flycheck-def-config-file-var flycheck-jscsrc javascript-jscs ".jscsrc"
  :safe #'stringp)

(flycheck-define-checker javascript-jscs
  "A JavaScript style checker using JSCS.

See URL `http://jscs.info/'."
  :command ("jscs"
            "--reporter" "checkstyle"
            (config-file "--config" flycheck-jscsrc)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (js-mode js2-mode js3-mode)
  :next-checkers (javascript-jshint))
(add-to-list 'flycheck-checkers 'javascript-jscs)

(defcustom jscs-format-enabled t
  "*Turn on/off JSCS formatting"
  :type 'boolean
  :group 'jscs)

(defcustom jscs-preset nil
  "*JSCS preset config"
  :type 'string
  :group 'jscs)

(defun jscs-format ()
  (if jscs-format-enabled
      (progn
        (shell-command
         (format "jscs %s --fix %s" (if jscs-preset (concat "--preset " jscs-preset) "") buffer-file-name)
         "*JSCS*")
        (revert-buffer t t)
        )))

(add-hook 'js-mode-hook
          (lambda()
            (electric-indent-mode t)
            (c-set-offset 'case-label '+)
            (local-set-key (kbd "C-c C-d") 'js-doc-insert-function-doc)
            (add-hook 'after-save-hook 'jscs-format t t)
            ))

(provide 'init-javascript)
