;; JSCS Formatter
(defcustom jscs-format-enabled nil
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
            (custom-set-variables '(js-switch-indent-offset js-indent-level))
            (local-set-key (kbd "C-c C-d") 'js-doc-insert-function-doc)
            (add-hook 'after-save-hook 'jscs-format t t)
            ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Flycheck JSCS
;;
;; FIXME: 本家で開発中のため、リリースされたらこのコードは削除する
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscsrc"
  :safe #'stringp)
(flycheck-define-checker javascript-jscs
  "A JavaScript code style checker.
See URL `http://jscs.info/'."
  :command ("jscs" "--reporter" "checkstyle"
            (config-file "--config" flycheck-jscs)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (js-mode js2-mode js3-mode)
  :next-checkers (javascript-jshint))

(defun flycheck-jscs-enable () (interactive)
       (add-to-list 'flycheck-checkers 'javascript-jscs))

(defun flycheck-jscs-disable () (interactive)
       (setq flycheck-checkers (remove 'javascript-jscs flycheck-checkers)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-javascript)
