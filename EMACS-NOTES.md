# Emacs 覚書

## キーバインド

| Key     | Description  |
| ------- | ------------ |
| `C-M-s` | 正規表現検索 |
| `M-s w` | 単語検索     |

## 便利コマンド

| Name                                               | Description           |
| -------------------------------------------------- | --------------------- |
| `align-regexp`                                     | 列揃えの整形          |
| `M-: (byte-recompile-directory "~/.emacs.d/" 0 t)` | 全Elispの再コンパイル |

## yasnippet に web-mode を追加するコマンド

```sh
ORIG_DIR=$(pwd)
cd ~/.emacs.d/elpa/yasnippet-*/snippets
mkdir web-mode
cd web-mode
(echo "html-mode"; echo "css-mode"; echo "js-mode") > .yas-parents
cd $ORIG_DIR
unset ORIG_DIR
```

## TIPS for Windows

```elisp
;; rgrep を有効にする
(setenv "PATH" (format "C:\\Program Files\\Git\\usr\\bin;%s" (getenv "PATH")))
(setq null-device "/dev/null")
```

See `emacs-{version}/share/emacs/{version}/README.W32`.

## Flycheck の設定をディレクトリによって変える

対象ディレクトリに `.dir-locals.el` ファイルを置く。↓は JSHint チェックを無効にする例。

```elisp
((js-mode (flycheck-disabled-checkers javascript-jshint)))
```

See [Flycheck manual](http://www.flycheck.org/manual/latest/Syntax-checkers.html).
