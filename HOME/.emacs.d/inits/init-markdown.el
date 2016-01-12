(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(add-hook 'markdown-mode-hook
          (lambda()
            (custom-set-variables
             '(markdown-command "marked")
             '(markdown-content-type "application/xhtml+xml")
             '(markdown-css-paths '("http://code.ngoldman.me/gfm.css/gfm.css"
                                    "http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.1.0/styles/default.min.css"))
             '(markdown-xhtml-header-content "
<style>body { overflow: auto !important; }</style>
<script>window.addEventListener('DOMContentLoaded', function() { document.body.className = 'markdown-body' })</script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.1.0/highlight.min.js'></script>
<script>hljs.initHighlightingOnLoad();</script>")
             )))

(provide 'init-markdown)
