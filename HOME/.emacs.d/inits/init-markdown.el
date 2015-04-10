(custom-set-variables
 '(markdown-command "marked --gfm")
 '(markdown-css-path "http://code.ngoldman.me/gfm.css/gfm.css")
 )

(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))

(provide 'init-markdown)
;;; init-markdown.el ends here
