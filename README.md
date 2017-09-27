# dotfiles

## Install

```sh
curl -o- -L https://raw.githubusercontent.com/ybiquitous/dotfiles/master/install.sh | sh
```

## Links

- [Emacs Tips](EMACS-TIPS.md)
- [Qiita](//qiita.com/ybiquitous)

## For Windows

Use 'mklink' as Administrator on Windows, instead 'ln -s'.

```bat
mklink .gitconfig dotfiles\HOME\.gitconfig
mklink /D .emacs.d dotfiles\HOME\.emacs.d
```

## Update home directory names

```sh
LANG=C xdg-user-dirs-gtk-update
```

## [Terminator](http://gnometerminator.blogspot.jp/)

| Key binding                         | Description          |
| ----------------------------------- | -------------------- |
| <kbd>Shift + Ctrl + O</kbd>         | 画面を水平に分割     |
| <kbd>Shift + Ctrl + E</kbd>         | 画面を垂直に分割     |
| <kbd>Ctrl + Tab</kbd>               | 分割した画面間を移動 |
| <kbd>Shift + Ctrl + T</kbd>         | 新しいタブを開く     |
| <kbd>Ctrl + PageUp (PageDown)</kbd> | タブ間を移動         |
| <kbd>Shift + Ctrl + C</kbd>         | コピー               |
| <kbd>Shift + Ctrl + V</kbd>         | 貼り付け             |
| <kbd>Shift + Ctrl + F</kbd>         | 検索                 |

## Eclipse keybind (based on Emacs)

| Key binding            | Description                      |
| ---------------------- | -------------------------------- |
| <kbd>Ctrl + H</kbd>    | Delete Previous                  |
| <kbd>Alt + H</kbd>     | Maximize Active View or Editor   |
| <kbd>Alt + H</kbd>     | Open Search Dialog               |
| <kbd>Ctrl + }</kbd>    | Toggle Split Editor (Horizontal) |

## JDK font setting on Linux

```sh
cd ${JAVA_HOME}/jre/lib/fonts/
mkdir fallback
cd fallback
ln -s /usr/share/fonts/truetype/****.ttf .
```
