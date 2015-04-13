# For Windows

Use 'mklink' as Administrator on Windows, instead 'ln -s'.

# Update home directory names

```sh
$ LANG=C xdg-user-dirs-gtk-update
```

# Emacs byte recompile all

```
C-u 0 M-x byte-recompile-directory
```

# Emacs Upgrade All Packages

```
M-x list-packages
Type 'U'
Type 'x'
```

# Add yasnippet of web-mode

```sh
$ cd HOME/.emacs.d/elpa/yasnippet-*/snippets
$ mkdir web-mode
$ cd web-mode
$ (echo "html-mode"; echo "css-mode"; echo "js-mode") > .yas-parents
```

# JDK font setting on Linux

```sh
$ cd $JAVA_HOME/jre/lib/fonts/
$ mkdir fallback
$ cd fallback
$ ln -s /usr/share/fonts/truetype/****.ttf .
```

# Install npm on Ubuntu

```sh
$ sudo add-apt-repository ppa:chris-lea/node.js
$ sudo apt-get update
$ sudo apt-get install nodejs
$ sudo npm install -g jsonlint jshint csslint js-beautify jscs jscs-jsdoc marked
```

# Eclipse keybind (based on Emacs)

- Delete Previous: __Ctrl+H__
- Maximize Active View or Editor: __Alt+M__
- Open Search Dialog: __Alt+H__
- Toggle Split Editor (Horizontal): __Ctrl+}__
