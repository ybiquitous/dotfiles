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
            (custom-set-variables
             '(js-switch-indent-offset js-indent-level)
             '(json-reformat:indent-width js-indent-level)
             '(json-reformat:pretty-string? t))
            (local-set-key (kbd "C-c i") 'js-doc-insert-function-doc)
            (local-set-key (kbd "@") 'js-doc-insert-tag)
            (add-hook 'after-save-hook 'jscs-format t t)
            (if (not (equal (file-name-extension buffer-file-name) "json"))
                (progn
                  (if (eq system-type 'windows-nt) (defvar tern-command '("tern")))
                  (tern-mode t)))
            ))

(eval-after-load 'tern
  '(progn
     (add-to-list 'company-backends 'company-tern)))

(add-to-list 'auto-mode-alist '("\\.jshintrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jscsrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tern-config\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))

(provide 'init-javascript)
