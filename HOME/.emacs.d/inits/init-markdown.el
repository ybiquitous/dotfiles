(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'markdown-mode-hook
          (lambda()
            (custom-set-variables
             '(markdown-command "marked --gfm")
             '(markdown-css-path "http://code.ngoldman.me/gfm.css/gfm.css")
             )
            ))

(provide 'init-markdown)
