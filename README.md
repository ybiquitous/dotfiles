# dotfiles

## Install

```sh
curl -o- -L https://raw.githubusercontent.com/ybiquitous/dotfiles/master/install.sh | sh
```

## Links

- [EMACS-NOTES](EMACS-NOTES.md)
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

| Key binding              | Description          |
| ------------------------ | -------------------- |
| Shift + Ctrl + O         | 画面を水平に分割     |
| Shift + Ctrl + E         | 画面を垂直に分割     |
| Ctrl + Tab               | 分割した画面間を移動 |
| Shift + Ctrl + T         | 新しいタブを開く     |
| Ctrl + PageUp (PageDown) | タブ間を移動         |
| Shift + Ctrl + C         | コピー               |
| Shift + Ctrl + V         | 貼り付け             |
| Shift + Ctrl + F         | 検索                 |

## Eclipse keybind (based on Emacs)

| Key binding | Description                      |
| ------------| -------------------------------- |
| Ctrl + H    | Delete Previous                  |
| Alt + H     | Maximize Active View or Editor   |
| Alt + H     | Open Search Dialog               |
| Ctrl + }    | Toggle Split Editor (Horizontal) |

## JDK font setting on Linux

```sh
cd ${JAVA_HOME}/jre/lib/fonts/
mkdir fallback
cd fallback
ln -s /usr/share/fonts/truetype/****.ttf .
```
