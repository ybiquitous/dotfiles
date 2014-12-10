(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(electric-pair-mode t)
 '(global-font-lock-mode t)
 '(global-hl-line-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-number-mode t)
 '(make-backup-files nil)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode nil)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(x-select-enable-clipboard t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white" :height 110)))))

(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes '("\\.zip\\'" ".zip" "unzip")))

;;(set-frame-parameter nil 'alpha 80)

(prefer-coding-system 'utf-8-unix)

(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/extras")

;; key bindings
(global-set-key (kbd "C-h")     'delete-backward-char)
(global-set-key (kbd "M-h")     'backward-kill-word)
(global-set-key (kbd "C-?")     'help-command)
(global-set-key (kbd "C-!")     'linum-mode)
(global-set-key (kbd "C-c l")   'toggle-truncate-lines)
(global-set-key (kbd "C-c C-v") 'browse-url-of-buffer)

;; package
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; shellscript
(add-hook 'sh-mode-hook
          (lambda()
            (custom-set-variables '(sh-basic-offset tab-width))
            (linum-mode t)
            ))

;; javascript
(add-hook 'js-mode-hook
          (lambda()
            (custom-set-variables '(js-indent-level tab-width))
            (flymake-jshint-load)
            (linum-mode t)
            (electric-indent-mode t)
            (c-set-offset 'case-label '+)
            (local-set-key (kbd "C-c C-b") 'web-beautify-js)
            (local-set-key (kbd "C-c C-d") 'js-doc-insert-function-doc)
            ))

;; json
(add-hook 'json-mode-hook 'flymake-json-maybe-load)

;; css
(add-hook 'css-mode-hook
          (lambda()
            (custom-set-variables '(css-indent-offset tab-width))
            (flymake-css-load)
            (linum-mode t)
            ))

;; java
(add-hook 'java-mode-hook
          (lambda()
            (linum-mode t)
            ))

;; scala
(add-hook 'scala-mode-hook
          (lambda()
            (custom-set-variables '(flymake-scala-compiler "fsc"))
            (flymake-scala-load)
            (linum-mode t)
            ))

;; perl
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda()
            (flymake-mode t)
            ))

;; ruby
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; yasnippet
(yas-global-mode t)

;; web
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;;(require 'flymake-html)
(add-hook 'web-mode-hook
          (lambda ()
            (custom-set-variables
             '(web-mode-markup-indent-offset tab-width)
             '(web-mode-code-indent-offset tab-width)
             '(web-mode-css-indent-offset tab-width)
             '(web-mode-sql-indent-offset tab-width))
            (linum-mode t)
            ))

;; xml
(add-hook 'nxml-mode-hook
          (lambda ()
            (custom-set-variables
             '(nxml-slash-auto-complete-flag t)
             '(nxml-auto-insert-xml-declaration-flag t)
             '(nxml-default-buffer-file-coding-system 'utf-8-dos))
            (linum-mode t)
            ))

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

;; https://github.com/k1LoW/emacs-drill-instructor/wiki
(require 'drill-instructor)
;;(setq drill-instructor-global t)

;; emmet(zen-coding)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'emmet-mode-hook
          (lambda ()
            (custom-set-variables '(emmet-indentation tab-width))
            ))
