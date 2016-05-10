(require 'company-tern)

(add-hook 'js-mode-hook
          (lambda()
            (electric-indent-mode t)
            (custom-set-variables
             '(js-switch-indent-offset js-indent-level)
             '(json-reformat:indent-width js-indent-level)
             '(json-reformat:pretty-string? t))
            (local-set-key (kbd "C-c i") 'js-doc-insert-function-doc)
            (local-set-key (kbd "@") 'js-doc-insert-tag)
            (if (not (equal (file-name-extension buffer-file-name) "json"))
                (progn
                  (if (eq system-type 'windows-nt) (defvar tern-command '("tern")))
                  (tern-mode t)
                  (add-to-list 'company-backends 'company-tern)
                  (js-auto-format-mode t)
                  (custom-set-variables
                   '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs javascript-eslint))
                   '(js-auto-format-command "standard-format")
                   '(js-auto-format-command-args "--write"))
                  ))))

(add-to-list 'auto-mode-alist '("\\.jshintrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jscsrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tern-config\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))

(provide 'init-javascript)
