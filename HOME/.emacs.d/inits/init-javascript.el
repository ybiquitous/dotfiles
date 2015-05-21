(require 'flycheck)

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

(defun jscs-format-enable () (interactive)
  (custom-set-variables '(jscs-format-enabled t)))

(defun jscs-format-disable () (interactive)
  (custom-set-variables '(jscs-format-enabled nil)))

(defvar jscs-buffer-name "*JSCS*")

(defun jscs-format ()
  (if jscs-format-enabled
      (progn
        (shell-command
         (format "jscs --fix --reporter inline %s %s"
                 (if jscs-preset (concat "--preset " jscs-preset) "")
                 buffer-file-name)
         jscs-buffer-name)
        (revert-buffer t t)

        ;; if no errors, close window and buffer
        (if (eq (buffer-size (get-buffer jscs-buffer-name)) 0)
            (progn
              (if (not (one-window-p))
                  (delete-window (get-buffer-window jscs-buffer-name)))
              (kill-buffer jscs-buffer-name)))
        )))

(add-hook 'js-mode-hook
          (lambda()
            (electric-indent-mode t)
            (c-set-offset 'case-label '+)
            (local-set-key (kbd "C-c C-d") 'js-doc-insert-function-doc)
            (add-hook 'after-save-hook 'jscs-format t t)
            ))

(provide 'init-javascript)
