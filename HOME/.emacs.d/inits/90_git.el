(use-package git-commit
  :custom
  (git-commit-summary-max-length 100)
  :config
  (global-git-commit-mode)
  (add-hook 'git-commit-mode-hook #'flyspell-mode))

;; disable git pager
(setenv "GIT_PAGER" "")
