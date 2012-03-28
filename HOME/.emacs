(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(default-frame-alist (quote ((menu-bar-lines . 1) (width . 40) (height . 30) (tool-bar-lines . 0))))
 '(global-font-lock-mode t nil (font-lock))
 '(global-whitespace-mode nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-spacing nil)
 '(make-backup-files nil)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode t)
 '(tab-width 4)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(x-select-enable-clipboard t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white")))))

;; default bold
;;(add-hook 'term-setup-hook (lambda() (buffer-face-set 'bold)))
;;(add-hook 'find-file-hook  (lambda() (buffer-face-set 'bold)))

;; key setting
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\M-r" 'replace-regexp)
(global-set-key "\C-x\M-s" 'replace-string)
(global-set-key "\C-x\M-u" 'untabify)
(global-set-key "\C-x\M-c" 'customize-variable)

;; site-lisp
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; auto-install.el
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(auto-install-compatibility-setup)

;; anything.el
;;(defvar org-directory "")
;;(require 'anything-startup)

;; japanese environment
;;(setq current-language-environment 'Japanese)
;;(setq keyboard-coding-system 'utf-8)
;;(set-terminal-coding-system 'utf-8)
;;(set-buffer-file-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)
;;(set-file-name-coding-system 'utf-8)

;; trim whitespace
(defun trim-buffer ()
  "Delete excess white space."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match "" nil nil))
    (goto-char (point-max))
    (delete-blank-lines)
    (mark-whole-buffer)
    (untabify (region-beginning) (region-end))))

;; truncate lines ON/OFF
(defun toggle-truncate-lines ()
  "Toggle truncate-lines variable."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; perl
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
            (perl-completion-mode t)))
(defun perl-eval (beg end)
  "Run selected region as Perl code"
  (interactive "r")
  (shell-command-on-region beg end "perl"))
(global-set-key "\M-\C-p" 'perl-eval)
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q -i=2" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
  (perltidy-region)))
(global-set-key "\C-ct" 'perltidy-region)
;;(require 'perlcritic)

;; haml & sass & mustache
;;(require 'haml-mode)
;;(require 'sass-mode)
;;(require 'mustache-mode)

;; scala
(add-to-list 'load-path "~/scala/misc/scala-tool-support/emacs/")
(require 'scala-mode-auto)

;; PATH
(setenv "PATH" (concat (getenv "PATH") ":$HOME/scala/bin:$HOME/maven/bin"))
(setq exec-path (append (list "~/scala/bin" "~/maven/bin") exec-path))

;; Eshell Alias
(eval-after-load "em-alias" '(progn
  (eshell/alias "ll" "ls -l")
  (eshell/alias "la" "ls -la")
  (eshell/alias "cp" "cp -i")
  (eshell/alias "rm" "rm -i")
  (eshell/alias "mv" "mv -i")
  (eshell/alias "df" "df -h")
  (eshell/alias "du" "du -h")
  (eshell/alias "su" "su -l")
  (eshell/alias ".." "cd ..")
  (eshell/alias "..." "cd ../..")
  (eshell/alias "grep" "grep --color=auto")
  (eshell/alias "h" "history")
  (eshell/alias "diff" "colordiff -u")
  (eshell/alias "e" "emacs")
  (eshell/alias "en" "emacs -nw")
  (eshell/alias "iperl" "perl -de 1")
  (eshell/alias "sedperl" "perl -pe")
))

;; Zen-Coding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(setq zencoding-indentation 2)

;; ruby
(add-to-list 'load-path "~/.emacs.d/site-lisp/ruby/")
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
