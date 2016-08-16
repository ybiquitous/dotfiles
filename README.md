# dotfiles

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

## Tools

- emacs
- zsh
- git
- xclip
- nvm
- docker

### zsh

Use [prezto](https://github.com/sorin-ionescu/prezto).

    diff --git a/runcoms/zpreztorc b/runcoms/zpreztorc
    index e93ac6b..34eb1ea 100644
    --- a/runcoms/zpreztorc
    +++ b/runcoms/zpreztorc
    @@ -32,7 +32,13 @@ zstyle ':prezto:load' pmodule \
    'spectrum' \
    'utility' \
    'completion' \
    -  'prompt'
    +  'prompt' \
    +  'history-substring-search' \
    +  'osx' \
    +  'git' \
    +  'ruby' \
    +  'rails' \
    +  'node'

    #
    # Autosuggestions
    diff --git a/runcoms/zprofile b/runcoms/zprofile
    index d87cb3b..01df15e 100644
    --- a/runcoms/zprofile
    +++ b/runcoms/zprofile
    @@ -17,8 +17,8 @@ fi
    # Editors
    #

    -export EDITOR='nano'
    -export VISUAL='nano'
    +export EDITOR='/Applications/Emacs.app/Contents/MacOS/Emacs'
    +export VISUAL='/Applications/Emacs.app/Contents/MacOS/Emacs'
    export PAGER='less'

    #
    @@ -43,6 +43,7 @@ typeset -gU cdpath fpath mailpath path

    # Set the list of directories that Zsh searches for programs.
    path=(
    +  "${HOME}/bin"
    /usr/local/{bin,sbin}
    $path
    )

TODO: Remove `.zsh*` from git repo.

## Install _[Terminator](http://gnometerminator.blogspot.jp/)_ (High Functional Terminal)

```sh
sudo apt-get install terminator
```

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

## JDK font setting on Linux

```sh
cd ${JAVA_HOME}/jre/lib/fonts/
mkdir fallback
cd fallback
ln -s /usr/share/fonts/truetype/****.ttf .
```

## Install Node.js and npm commands

See <https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager>

```sh
npm install -g \
  jsonlint \
  jshint \
  eslint \
  standard \
  standard-format \
  stylelint \
  jscs \
  js-beautify \
  marked \
  editorconfig \
  tern \
  node-sass
```

## Eclipse keybind (based on Emacs)

- Delete Previous: __Ctrl+H__
- Maximize Active View or Editor: __Alt+M__
- Open Search Dialog: __Alt+H__
- Toggle Split Editor (Horizontal): __Ctrl+}__

## Use diff-highlight on "git diff"

```sh
cd ~/bin
curl -O https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight
chmod +x diff-highlight
```

or

```sh
cd ~/bin
ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight
sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
```
