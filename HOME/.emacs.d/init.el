;;; init.el --- ybiquitous's Emacs configuration
;;
;; Copyright (c) 2017 ybiquitous
;;
;; Author: ybiquitous <ybiquitous@gmail.com>
;; URL: https://github.com/ybiquitous/dotfiles

;;; Commentary:

;; This is my personal Emacs configuration.

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(css-indent-offset tab-width)
 '(electric-pair-mode t)
 '(global-font-lock-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-number-mode t)
 '(load-prefer-newer t)
 '(make-backup-files nil)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-default-buffer-file-coding-system (quote utf-8))
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages
   (quote
    (init-loader yasnippet yaml-mode web-mode use-package scss-mode robe rjsx-mode rbenv popup markdown-mode json-mode js-auto-format-mode highlight-symbol git-commit flycheck exec-path-from-shell emmet-mode editorconfig company-tern)))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(scroll-bar-mode (quote right))
 '(select-enable-clipboard t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode nil)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white")))))

(prefer-coding-system 'utf-8-unix)

(fset 'yes-or-no-p 'y-or-n-p)

;; package (https://github.com/melpa/melpa)
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://stable.melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa-stable" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; init-loader
(unless (package-installed-p 'init-loader) (package-install 'init-loader))
(init-loader-load)

;; vc-mode bug hack
;; See http://www.lares.dti.ne.jp/~foozy/fujiguruma/scm/cvs-emacs.html
(defadvice vc-before-save
  (around examine-vc-make-backup-files activate)
  "Examine `vc-make-backup-files' (in vc-hooks.el) at first."
  (and vc-make-backup-files ad-do-it))

;;; init.el ends here
