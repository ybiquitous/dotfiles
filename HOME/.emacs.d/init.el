(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode t)
 '(global-font-lock-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-number-mode t)
 '(make-backup-files nil)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode nil)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(x-select-enable-clipboard t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white")))))

(prefer-coding-system 'utf-8-unix)

;; key setting
(global-set-key (kbd "C-h")     'delete-backward-char)
(global-set-key (kbd "C-x M-r") 'replace-regexp)
(global-set-key (kbd "C-x M-s") 'replace-string)
(global-set-key (kbd "C-x M-u") 'untabify)
(global-set-key (kbd "C-x M-c") 'customize-variable)
(global-set-key (kbd "C-c l")   'toggle-truncate-lines)

;; auto-install
(add-to-list 'load-path "~/.emacs.d/auto-install")
(require 'auto-install)
;;(auto-install-update-emacswiki-package-name t)

;; anything
;;(require 'anything-startup)

;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; javascript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(custom-set-variables '(js2-basic-offset 2))

;; coffeescript
(require 'coffee-mode)

;; perl
(defun perl-eval (beg end)
  "Run selected region as Perl code"
  (interactive "r")
  (shell-command-on-region beg end "perl"))
(global-set-key (kbd "M-C-p") 'perl-eval)

(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda()
            (setq indent-tabs-mode nil)
            (setq tab-width nil)
            (require 'auto-complete)
            (require 'perl-completion)
            (perl-completion-mode)
            (flymake-mode t)
            (add-to-list 'ac-sources 'ac-source-perl-completion)
;;            (define-key plcmp-mode-map (kbd "M-C-p") 'plcmp-cmd-eval-on-region)
            ))

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(custom-set-variables '(yas-snippet-dirs '("~/.emacs.d/yasnippet/snippets")))
(yas-global-mode 1)

;; scala
(add-to-list 'load-path "~/.emacs.d/scala-mode")
(require 'scala-mode-auto)
