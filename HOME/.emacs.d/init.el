(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(global-font-lock-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-number-mode t)
 '(make-backup-files nil)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(scroll-bar-mode 'right)
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
 '(default ((t (:background "black" :foreground "white" :height 110)))))

;;(set-frame-parameter nil 'alpha 80)

(prefer-coding-system 'utf-8-unix)

(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/extras")

;; key setting
(global-set-key (kbd "C-h")     'delete-backward-char)
(global-set-key (kbd "C-x M-r") 'replace-regexp)
(global-set-key (kbd "C-x M-s") 'replace-string)
(global-set-key (kbd "C-x M-u") 'untabify)
(global-set-key (kbd "C-x M-c") 'customize-variable)
(global-set-key (kbd "C-c l")   'toggle-truncate-lines)
(global-set-key (kbd "C-x M-v") 'browse-url-of-buffer)

;; package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; javascript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          (lambda ()
            (custom-set-variables '(js2-basic-offset 2))
            ))

;; json
(add-hook 'js-mode-hook 'flymake-json-maybe-load)

;; css
(add-hook 'css-mode-hook 'flymake-css-load)

;; perl
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda()
            (cperl-toggle-electric)
            (flymake-mode t)
            ))

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; scala
(require 'scala-mode2)

;; nxml
(add-to-list 'auto-mode-alist '("\\.[x]?html$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.jsp[x]?$"  . nxml-mode))
(add-to-list 'load-path "~/.emacs.d/html5-el")
(add-hook 'nxml-mode-hook
          (lambda ()
            (custom-set-variables
             '(nxml-slash-auto-complete-flag t)
             '(nxml-auto-insert-xml-declaration-flag t)
             '(nxml-default-buffer-file-coding-system (quote utf-8-dos)))

            (eval-after-load "rng-loc"
              '(add-to-list 'rng-schema-locating-files "~/.emacs.d/html5-el/schemas.xml"))
            (require 'whattf-dt)
            ))

;; mozrepl
(autoload 'moz-minor-mode "moz" nil t)
(add-hook 'moz-minor-mode-hook
          (lambda ()
            (add-hook 'after-save-hook
                      '(lambda ()
                         (interactive)
                         (comint-send-string (inferior-moz-process) "BrowserReload();"))
                      'append 'local) ; buffer-local
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
