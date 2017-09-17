;; private
(defun _template-word-func (func)
  (let (word bounds start end)
    (setq word (thing-at-point 'symbol))
    (setq bounds (bounds-of-thing-at-point 'symbol))
    (setq start (car bounds))
    (setq end (cdr bounds))
    (delete-region start end)
    (insert (funcall func word))))

(use-package s
  :config
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
  (global-set-key (kbd "C-c c u") 'upper-camel-case-word))

;; frame title
(setq frame-title-format '("" "%b @ Emacs " emacs-version))

;; for emacsclient
(if window-system (add-hook 'after-init-hook 'server-start t))
