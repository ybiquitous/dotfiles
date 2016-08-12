(require 'company-tern)

(defun js-mode-hooks ()
  (custom-set-variables
   '(js-switch-indent-offset js-indent-level)
   '(json-reformat:indent-width js-indent-level)
   '(json-reformat:pretty-string? t)))
(add-hook 'js-mode-hook 'js-mode-hooks)

(defun js2-mode-hooks ()
  (custom-set-variables
   '(js2-basic-offset js-indent-level)
   '(js2-mode-show-parse-errors nil)
   '(js2-mode-show-strict-warnings nil))
  (local-set-key (kbd "C-c i") 'js-doc-insert-function-doc)
  (local-set-key (kbd "@") 'js-doc-insert-tag)
  (electric-indent-mode t)
  (if (not (equal (file-name-extension buffer-file-name) "json"))
      (progn
        (if (eq system-type 'windows-nt) (defvar tern-command '("tern")))
        (tern-mode t)
        (add-to-list 'company-backends 'company-tern)
        )))
(add-hook 'js2-mode-hook 'js2-mode-hooks)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.tern-config\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))

(provide 'init-javascript)
