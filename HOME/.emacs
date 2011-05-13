(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(default-frame-alist (quote ((cursor-color . "green") (menu-bar-lines . 1) (tool-bar-lines . 0) (right-fringe) (left-fringe) (background-color . "black") (foreground-color . "white") (width . 100) (height . 50) (top . 200) (left . 200) (font . "8x13") (vertical-scroll-bars . right))))
 '(global-font-lock-mode t nil (font-lock))
 '(global-whitespace-mode nil)
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
 )

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
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; perl
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
            (perl-completion-mode t)))

;; haml & sass
(require 'haml-mode)
(require 'sass-mode)
