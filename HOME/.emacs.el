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

;; key setting
(global-set-key "\C-h"     'delete-backward-char)
(global-set-key "\C-x\M-r" 'replace-regexp)
(global-set-key "\C-x\M-s" 'replace-string)
(global-set-key "\C-x\M-u" 'untabify)
(global-set-key "\C-x\M-c" 'customize-variable)

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
(global-set-key "\C-xt" 'trim-buffer)

;; truncate lines ON/OFF
(defun toggle-truncate-lines ()
  "Toggle truncate-lines variable."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;; scala
(add-to-list 'load-path "/opt/scala/scala-mode")
(require 'scala-mode-auto)

;; markdown
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
