(use-package git-commit
  :config
  (global-git-commit-mode)
  (add-hook 'git-commit-mode-hook 'flyspell-mode))

;; disable git pager
(setenv "GIT_PAGER" "")
