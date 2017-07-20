(use-package git-commit
  :ensure t
  :init (global-git-commit-mode)
  :config
  (add-hook 'git-commit-mode-hook 'flyspell-mode))
