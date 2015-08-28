# Emacs 覚書

## キーバインド

| Key | Notes |
| --- | ----- |
| `C-M-s` | 正規表現検索 |
| `M-s w` | 単語検索 |

## 便利コマンド

| Name | Notes |
| ---- | ----- |
| `align-regexp` | 列揃えの整形 |

## TIPS for Windows

```elisp
;; rgrep を有効にする
(setenv "PATH" (format "C:\\Program Files\\Git\\usr\\bin;%s" (getenv "PATH")))
(setq null-device "/dev/null")
```
