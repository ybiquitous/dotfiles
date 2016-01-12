(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(add-hook 'markdown-mode-hook
          (lambda()
            (custom-set-variables
             '(markdown-command "marked")
             '(markdown-content-type "application/xhtml+xml")
             '(markdown-css-paths '("http://code.ngoldman.me/gfm.css/gfm.css"))
             '(markdown-xhtml-header-content "<script>window.onload = function() { document.body.className = 'markdown-body' }</script>")
             )
            ))

(provide 'init-markdown)
