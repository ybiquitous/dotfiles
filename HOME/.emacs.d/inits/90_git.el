(use-package git-commit
  :init (global-git-commit-mode)
  :config
  (add-hook 'git-commit-mode-hook 'flyspell-mode))

;; disable git pager
(setenv "GIT_PAGER" "")
