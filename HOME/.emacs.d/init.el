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
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(scroll-bar-mode (quote right))
 '(select-enable-clipboard t)
 '(sh-basic-offset tab-width)
 '(sh-indentation tab-width)
 '(shell-file-name "/bin/sh")
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
    (face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark lines-tail))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white")))))

(prefer-coding-system 'utf-8-unix)

(fset 'yes-or-no-p 'y-or-n-p)

;; key bindings
(global-set-key (kbd "C-h")        'delete-backward-char)
(global-set-key (kbd "M-h")        'backward-kill-word)
(global-set-key (kbd "C-?")        'help-command)
(global-set-key (kbd "C-c l")      'toggle-truncate-lines)
(global-set-key (kbd "C-c C-v")    'browse-url-of-buffer)
(global-set-key (kbd "C-c <up>")   'text-scale-increase)
(global-set-key (kbd "C-c <down>") 'text-scale-decrease)
(global-set-key (kbd "C-c 0")      'text-scale-adjust)
(global-set-key (kbd "C-c C-r")    'eval-buffer)

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

;; exec-path
(if (not (equal system-type 'windows-nt)) (exec-path-from-shell-initialize))

;; init-loader
(require 'init-loader)
(init-loader-load)

;; dired
(require 'wdired)
(setq wdired-allow-to-change-permissions t)
(define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)

;; perl
(defalias 'perl-mode 'cperl-mode)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; yasnippet
(yas-global-mode t)

;; web
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; shell script
(add-to-list 'auto-mode-alist '("\\.sh\\'" . sh-mode))

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
  "Examine `vc-make-backup-files' (in vc-hooks.el) at first."
  (and vc-make-backup-files ad-do-it))

;; emmet(zen-coding)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'rjsx-mode-hook 'emmet-mode)

;; highlight-symbol
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode) ;; move by M-p/M-n
(add-hook 'highlight-symbol-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c r") 'highlight-symbol-query-replace)
            ))

;; git-commit
(global-git-commit-mode)
(add-hook 'git-commit-mode-hook 'flyspell-mode)

;;; init.el ends here
