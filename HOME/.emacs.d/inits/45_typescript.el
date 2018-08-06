(defun my/setup-tide-mode ()
  (setq-local js-auto-format-command "tslint")
  (setq-local js-auto-format-command-args "--fix")
  (tide-setup)
  (flycheck-mode +1)
  (setq-local flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :delight
  :config
  (add-hook 'typescript-mode-hook #'my/setup-tide-mode)

  ;; TSX
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (defun my/enable-tsx-on-web-mode ()
    (if (string-equal "tsx" (file-name-extension buffer-file-name))
      (progn
        (my/setup-tide-mode))
      (setq-local flycheck-disabled-checkers '(typescript-tslint))))
  (add-hook 'web-mode-hook #'my/enable-tsx-on-web-mode))
