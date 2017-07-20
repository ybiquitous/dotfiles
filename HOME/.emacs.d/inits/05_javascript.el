(require 'company-tern)
(require 'flycheck)

(defun js-mode-hooks ()
  (setq
   js-indent-level tab-width
   js-switch-indent-offset tab-width
   json-reformat:indent-width tab-width
   json-reformat:pretty-string? t))
(add-hook 'js-mode-hook 'js-mode-hooks)

(defun js2-mode-hooks ()
  (setq
   js2-basic-offset tab-width
   js2-mode-show-parse-errors nil
   js2-mode-show-strict-warnings nil)
  (local-set-key (kbd "C-c i") 'js-doc-insert-function-doc)
  (if (not (equal (file-name-extension buffer-file-name) "json"))
      (progn
        (if (eq system-type 'windows-nt) (defvar tern-command '("tern")))
        (tern-mode t)
        (add-to-list 'company-backends 'company-tern)
        )))
(add-hook 'js2-mode-hook 'js2-mode-hooks)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.tern-config\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.babelrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . json-mode))

;; rjsx-mode
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook
          (lambda ()
            (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
            (flycheck-mode)))
