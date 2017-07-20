(require 's)

;; private
(defun _template-word-func (func)
  (let (word bounds start end)
    (setq word (thing-at-point 'symbol))
    (setq bounds (bounds-of-thing-at-point 'symbol))
    (setq start (car bounds))
    (setq end (cdr bounds))
    (delete-region start end)
    (insert (funcall func word))
    ))

(defun dasherize-word ()
  (interactive)
  (_template-word-func 's-dashed-words))

(defun lower-camel-case-word ()
  (interactive)
  (_template-word-func 's-lower-camel-case))

(defun upper-camel-case-word ()
  (interactive)
  (_template-word-func 's-upper-camel-case))

(global-set-key (kbd "C-c d")   'dasherize-word)
(global-set-key (kbd "C-c c l") 'lower-camel-case-word)
(global-set-key (kbd "C-c c u") 'upper-camel-case-word)

;; frame title
(setq frame-title-format '("" "%b @ Emacs " emacs-version))

;; exec-path (https://github.com/jwiegley/use-package#conditional-loading)
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))
