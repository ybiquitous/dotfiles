(use-package git-commit
  :config
  (setq git-commit-summary-max-length 80)
  (global-git-commit-mode)
  (add-hook 'git-commit-mode-hook #'flyspell-mode))

;; disable git pager
(setenv "GIT_PAGER" "")
