(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(current-language-environment "Japanese")
 '(default-frame-alist (quote ((cursor-color . "green") (menu-bar-lines . 1) (right-fringe) (left-fringe) (background-color . "black") (foreground-color . "white") (width . 80) (height . 30) (top . 200) (left . 200) (font . "8x13") (tool-bar-lines . 0))))
 '(global-font-lock-mode t)
 '(global-whitespace-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(install-elisp-repository-directory "~/.emacs.d/site-lisp/")
 '(keyboard-coding-system (quote utf-8))
 '(make-backup-files nil)
 '(scala-interpreter "~/scala/bin/scala")
 '(scala-mode-feature:electric-newline-before-closing-bracket t)
 '(scala-mode-feature:electric-on-per-default t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode t)
 '(tab-width 4)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(user-full-name "Koba, Masafumi")
 '(user-mail-address "10koba01@gmail.com")
 '(x-select-enable-clipboard t))

;; key setting
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\M-r" 'replace-regexp)
(global-set-key "\C-x\M-s" 'replace-string)
(global-set-key "\C-x\M-u" 'untabify)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; emacs lisp
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/scala/misc/scala-tool-support/emacs")

(require 'scala-mode-auto)

;; japanese environment
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

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
