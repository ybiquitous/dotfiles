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
 '(desktop-files-not-to-save nil)
 '(desktop-globals-to-save (quote (extended-command-history)))
 '(desktop-restore-frames nil)
 '(desktop-save-mode t)
 '(electric-pair-mode t)
 '(global-font-lock-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(line-number-mode t)
 '(load-prefer-newer t)
 '(make-backup-files nil)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-default-buffer-file-coding-system (quote utf-8))
 '(nxml-slash-auto-complete-flag t)
  '(package-selected-packages
     (quote
       (dockerfile-mode slim-mode a google-translate delight neotree add-node-modules-path js-auto-format-mode flycheck-package package-lint projectile ruby-electric git-commit yaml-mode emmet-mode web-mode robe enh-ruby-mode highlight-symbol markdown-mode json-mode rjsx-mode js2-mode company-tern tern flycheck editorconfig yasnippet yasnippet-snippets company s exec-path-from-shell init-loader use-package)))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(recentf-mode t)
 '(ruby-insert-encoding-magic-comment nil)
 '(scroll-bar-mode (quote right))
 '(select-enable-clipboard t)
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode nil)
 '(standard-indent 2)
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

;; IDO
(ido-mode t)
(ido-everywhere t)

;; package (https://github.com/melpa/melpa)
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                 (not (gnutls-available-p))))
        (protocol (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat protocol "://melpa.org/packages/")) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)
(use-package delight)

;; init-loader
(use-package init-loader
  :init (init-loader-load))

;; vc-mode bug hack
;; See http://www.lares.dti.ne.jp/~foozy/fujiguruma/scm/cvs-emacs.html
(defadvice vc-before-save
  (around examine-vc-make-backup-files activate)
  "Examine `vc-make-backup-files' (in vc-hooks.el) at first."
  (and vc-make-backup-files ad-do-it))

;;; init.el ends here
