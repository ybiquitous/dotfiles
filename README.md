# Links

- [EMACS-NOTES](EMACS-NOTES.md)

# For Windows

Use 'mklink' as Administrator on Windows, instead 'ln -s'.

```bat
> mklink .gitconfig dotfiles\HOME\.gitconfig
> mklink /D .emacs.d dotfiles\HOME\.emacs.d
```

# Update home directory names

```sh
LANG=C xdg-user-dirs-gtk-update
```

# Install _[Terminator](http://gnometerminator.blogspot.jp/)_ (High Functional Terminal)

```sh
sudo apt-get install terminator
```

| Key binding              | Description          |
| ------------------------ | -------------------- |
| Shift + Ctrl + O         | 画面を水平に分割     |
| Shift + Ctrl + E         | 画面を垂直に分割     |
| Shift + Ctrl + N         | 分割した画面間を移動 |
| Shift + Ctrl + T         | 新しいタブを開く     |
| Ctrl + PageUp (PageDown) | タブ間を移動         |
| Shift + Ctrl + C         | コピー               |
| Shift + Ctrl + V         | 貼り付け             |

# JDK font setting on Linux

```sh
cd ${JAVA_HOME}/jre/lib/fonts/
mkdir fallback
cd fallback
ln -s /usr/share/fonts/truetype/****.ttf .
```

# Install Node.js and npm commands

See https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

```sh
npm install -g jsonlint jshint eslint csslint js-beautify jscs marked editorconfig tern
```

# Eclipse keybind (based on Emacs)

- Delete Previous: __Ctrl+H__
- Maximize Active View or Editor: __Alt+M__
- Open Search Dialog: __Alt+H__
- Toggle Split Editor (Horizontal): __Ctrl+}__
