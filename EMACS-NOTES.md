# Emacs 覚書

## 環境依存初期化ファイルの設定

Windows:

```bat
mklink %USERPROFILE%\.emacs.d\inits\99_env.el %USERPROFILE%\99_env.el
```

## キーバインド

| Key                     | Description                                |
| ----------------------- | ------------------------------------------ |
| <kbd>C-M-s</kbd>        | 正規表現検索                               |
| <kbd>M-s w</kbd>        | 単語検索                                   |
| <kbd>C-q</kbd>          | 特殊文字入力                               |
| <kbd>M-!</kbd>          | シェルコマンド実行                         |
| <kbd>M-&</kbd>          | シェルコマンド実行(非同期)                 |
| <kbd>C-u M-!</kbd>      | シェルコマンドの出力を現在位置に挿入       |
| <kbd>C-u M-&#124;</kbd> | 選択範囲を標準入力としてシェルコマンド実行 |
| <kbd>C-x SPC</kbd>      | 矩形選択                                   |
| <kbd>C-x v g</kbd>      | `git blame`                                |
| <kbd>C-x v =</kbd>      | `git diff`                                 |
| <kbd>C-x v l</kbd>      | `git log`                                  |
| <kbd>C-c C-c p</kbd>    | Preview markdown                           |

## 便利コマンド

| Key                                                         | Description              |
| ----------------------------------------------------------- | ------------------------ |
| <kbd>M-x align-regexp</kbd>                                 | 列揃えの整形             |
| <kbd>M-: (byte-recompile-directory "~/.emacs.d/" 0 t)</kbd> | 全Elispの再コンパイル    |
| <kbd>yas-recompile-all</kbd>                                | 全snippetsの再コンパイル |
