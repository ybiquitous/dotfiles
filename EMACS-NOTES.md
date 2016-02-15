# Emacs 覚書

## キーバインド

| Key            | Description                                |
| -------------- | ------------------------------------------ |
| `C-M-s`        | 正規表現検索                               |
| `M-s w`        | 単語検索                                   |
| `C-q`          | 特殊文字入力                               |
| `M-!`          | シェルコマンド実行                         |
| `M-&`          | シェルコマンド実行(非同期)                 |
| `C-x SPC`      | 矩形選択                                   |
| `C-u M-¦` [^1] | 選択範囲を標準入力としてシェルコマンド実行 |

[^1]: 本来は `¦` (BROKEN BAR) ではなく `|` (VERTICAL BAR)。Markdownテーブルでエスケープできないため代用。

## 便利コマンド

| Name                                               | Description              |
| -------------------------------------------------- | ------------------------ |
| `align-regexp`                                     | 列揃えの整形             |
| `M-: (byte-recompile-directory "~/.emacs.d/" 0 t)` | 全Elispの再コンパイル    |
| `yas-recompile-all`                                | 全snippetsの再コンパイル |

## Tips

- [Windows の Emacs で rgrep を使えるようにする](http://qiita.com/ybiquitous/items/2f2206ff7a557c4cbc11)
- [Windows の Emacs で Myrica フォントを使う](http://qiita.com/ybiquitous/items/5b319a62e9260b65bab0)
- [Flycheck の設定をディレクトリによって変える方法](http://qiita.com/ybiquitous/items/9366bc4599abf78eac54)
