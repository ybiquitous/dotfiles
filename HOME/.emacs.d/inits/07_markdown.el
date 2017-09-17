(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("\\.md\\'" . gfm-mode)
          ("\\.markdown\\'" . gfm-mode))
  :config
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  (setq
    markdown-command "marked --tables --breaks"
    markdown-content-type "application/xhtml+xml"
    markdown-css-paths '("https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.8.0/github-markdown.min.css"
                          "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/github.min.css")
    markdown-xhtml-header-content
    (concat
      "<style>.markdown-body { box-sizing: border-box; min-width: 200px; max-width: 980px; margin: 0 auto; padding: 45px; }</style>"
      "<script src='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js'></script>"
      "<script>document.addEventListener('DOMContentLoaded', function() { document.body.className = 'markdown-body'; hljs.initHighlightingOnLoad(); })</script>")))
