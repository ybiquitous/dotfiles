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
 '(emmet-indentation tab-width)
 '(flycheck-temp-prefix ".flycheck")
 '(global-font-lock-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js-indent-level tab-width)
 '(line-number-mode t)
 '(load-prefer-newer t)
 '(make-backup-files nil)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-default-buffer-file-coding-system (quote utf-8))
 '(nxml-slash-auto-complete-flag t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/"))))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(scroll-bar-mode (quote right))
 '(sh-basic-offset tab-width)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode nil)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(web-mode-code-indent-offset tab-width)
 '(web-mode-css-indent-offset tab-width)
 '(web-mode-markup-indent-offset tab-width)
 '(web-mode-script-padding tab-width)
 '(web-mode-sql-indent-offset tab-width)
 '(web-mode-style-padding tab-width)
 '(whitespace-action (quote (auto-cleanup)))
 '(whitespace-display-mappings
   (quote
    ((space-mark 12288
                 [9633])
     (tab-mark 9
               [187 9]
               [92 9]))))
 '(whitespace-line-column 100)
 '(whitespace-space-regexp "\\(\\u3000+\\)")
 '(whitespace-style
   (quote
    (face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark lines-tail)))
 '(x-select-enable-clipboard t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white")))))

(prefer-coding-system 'utf-8-unix)

(fset 'yes-or-no-p 'y-or-n-p)

;; key bindings
(global-set-key (kbd "C-h")     'delete-backward-char)
(global-set-key (kbd "M-h")     'backward-kill-word)
(global-set-key (kbd "C-?")     'help-command)
(global-set-key (kbd "C-c l")   'toggle-truncate-lines)
(global-set-key (kbd "C-c C-v") 'browse-url-of-buffer)

;; package
(package-initialize)

;; exec-path
(if (not (equal system-type 'windows-nt)) (exec-path-from-shell-initialize))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; inits
(add-to-list 'load-path (expand-file-name "~/.emacs.d/inits"))
(require 'init-env)
(require 'init-common)
(require 'init-java)
(require 'init-javascript)
(require 'init-markdown)

;; perl
(defalias 'perl-mode 'cperl-mode)

;; auto-complete
;;(ac-config-default)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; yasnippet
(yas-global-mode t)

;; web
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; shell
(add-hook 'shell-mode-hook
          (lambda ()
            (setq comint-input-ring-file-name (getenv "HISTFILE"))
            (setq comint-input-ring-size (string-to-number (getenv "HISTSIZE")))
            (comint-read-input-ring t)
            (local-set-key (kbd "M-p") 'comint-previous-matching-input-from-input)
            (local-set-key (kbd "M-n") 'comint-next-matching-input-from-input)
            ))

;; vc-mode bug hack
;; See http://www.lares.dti.ne.jp/~foozy/fujiguruma/scm/cvs-emacs.html
(defadvice vc-before-save
  (around examine-vc-make-backup-files activate)
  "examine `vc-make-backup-files' (in vc-hooks.el) at first"
  (and vc-make-backup-files ad-do-it))

;; emmet(zen-coding)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

;;; init.el ends here
