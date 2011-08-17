(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(default-frame-alist (quote ((width . 40) (height . 30) (top . 200) (left . 200))))
 '(global-font-lock-mode t nil (font-lock))
 '(global-whitespace-mode nil)
 '(indent-tabs-mode nil)
 '(inhibit-splash-screen t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
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
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Takao¥´¥·¥Ã¥¯")))))

;; key setting
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\M-r" 'replace-regexp)
(global-set-key "\C-x\M-s" 'replace-string)
(global-set-key "\C-x\M-u" 'untabify)
(global-set-key "\C-x\M-c" 'customize-variable)

;; ???
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; site-lisp
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; auto-install.el
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(auto-install-compatibility-setup)

;; anything.el
(defvar org-directory "")
(require 'anything-startup)

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

;; js2-mode
;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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

;; haml & sass & mustache
;;(require 'haml-mode)
;;(require 'sass-mode)
;;(require 'mustache-mode)

;; scala
(add-to-list 'load-path "~/scala/misc/scala-tool-support/emacs/")
(require 'scala-mode-auto)

;; PATH
(setenv "PATH" (concat (getenv "PATH") ":$HOME/scala/bin"))
(setq exec-path (append exec-path '("~/scala/bin")))

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
