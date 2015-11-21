# For Windows

Use 'mklink' as Administrator on Windows, instead 'ln -s'.

# Update home directory names

```sh
LANG=C xdg-user-dirs-gtk-update
```

# Install [Terminator](http://gnometerminator.blogspot.jp/)

```sh
sudo apt-get install terminator
```

| Key binding              | Description          |
| ------------------------ | -------------------- |
| Ctrl + Shift + o         | 画面を水平に分割     |
| Ctrl + Shift + e         | 画面を垂直に分割     |
| Ctrl + Shift + n         | 分割した画面間を移動 |
| Ctrl + Shift + t         | 新しいタブを開く     |
| Ctrl + PageUp (PageDown) | タブ間を移動         |

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
npm install -g jsonlint jshint csslint js-beautify jscs jscs-jsdoc marked editorconfig tern
```

# Eclipse keybind (based on Emacs)

- Delete Previous: __Ctrl+H__
- Maximize Active View or Editor: __Alt+M__
- Open Search Dialog: __Alt+H__
- Toggle Split Editor (Horizontal): __Ctrl+}__
