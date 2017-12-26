(use-package google-translate
  :bind (("C-c t" . google-translate-at-point)
         ("C-c T" . google-translate-query-translate))
  :init
  (setq
    google-translate-default-source-language "en"
    google-translate-default-target-language "ja"))
