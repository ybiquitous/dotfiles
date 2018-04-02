(defun my/typescript-mode-hook ()
  (add-node-modules-path)
  (setq-local js-auto-format-command "tslint")
  (setq-local js-auto-format-command-args "--fix"))

(use-package typescript-mode
  :delight
  :config
  (add-hook 'typescript-mode-hook #'my/typescript-mode-hook))

(use-package tide
  :delight
  :config
  (defun setup-tide-mode ()
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  (add-hook 'typescript-mode-hook #'setup-tide-mode)

  ;; TSX
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (defun my/enable-tsx-on-web-mode ()
    (if (string-equal "tsx" (file-name-extension buffer-file-name))
      (progn
        (my/typescript-mode-hook)
        (setup-tide-mode))
      (setq-local flycheck-disabled-checkers '(typescript-tslint))))
  (add-hook 'web-mode-hook #'my/enable-tsx-on-web-mode))
