(use-package magit
  :bind (("C-x g" . magit-status)))

(defun my/git-commit-mode-hook ()
  (setq fill-column 100)
  (flyspell-mode))

(use-package git-commit
  :custom
  (git-commit-summary-max-length 100)
  :config
  (global-git-commit-mode)
  (add-hook 'git-commit-mode-hook #'my/git-commit-mode-hook))

;; disable git pager
(setenv "GIT_PAGER" "")
