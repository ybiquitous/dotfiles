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

;; formatting by JSCS
(defun jscs-format ()
  (interactive)
  (shell-command (concat "jscs --fix " buffer-file-name))
  (revert-buffer t t)
  )

;; hook
(add-hook 'js-mode-hook
          (lambda()
            (electric-indent-mode t)
            (c-set-offset 'case-label '+)
            (local-set-key (kbd "C-c C-b") 'web-beautify-js)
            (local-set-key (kbd "C-c C-d") 'js-doc-insert-function-doc)
            (add-hook 'after-save-hook 'jscs-format)
            ))

(provide 'init-javascript)
;;; init-javascript.el ends here
