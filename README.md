For Windows
-----------

    Use 'mklink' as Administrator on Windows, instead 'ln -s'.

Update home directory names
---------------------------

    LANG=C xdg-user-dirs-gtk-update

Emacs byte recompile all
------------------------

    C-u 0 M-x byte-recompile-directory

Emacs Upgrade All Packages
--------------------------

    M-x list-packages
    Type 'U'
    Type 'x'

Enable js-mode in Auto Complete Mode
------------------------------------

    cd HOME/.emacs.d/elpa/auto-complete-*/dict
    ln -s javascript-mode js-mode

Add yasnippet of web-mode
------------------------------------

    cd HOME/.emacs.d/elpa/yasnippet-*/snippets
    mkdir web-mode
    cd web-mode
    (echo "html-mode"; echo "css-mode"; echo "js-mode") > .yas-parents

JDK font setting on Linux
-------------------------

    cd $JAVA_HOME/jre/lib/fonts/
    mkdir fallback
    cd fallback
    ln -s /usr/share/fonts/truetype/****.ttf .

Install npm
---------------------------------

    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs
    sudo npm -g install jsonlint jslint jshint js-beautify csslint
