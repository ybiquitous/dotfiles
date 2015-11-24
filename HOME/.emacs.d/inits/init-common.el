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

;; Font setting
(when (eq system-type 'windows-nt)
  (set-frame-font "Consolas 11" t)
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "メイリオ"))
  (add-to-list 'face-font-rescale-alist '(".*メイリオ.*" . 1.1))
  )

(provide 'init-common)
