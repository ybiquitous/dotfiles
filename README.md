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

    M-x package-list-packages
    M-x package-menu-mark-upgrades
    Type 'x'

Enable js-mode in Auto Complete Mode
------------------------------------

    cd path/to/auto-complete/dict
    ln -s javascript-mode js-mode

JDK font setting on Linux
-------------------------

    cd $JAVA_HOME/jre/lib/fonts/
    sudo mkdir fallback
    cd fallback
    sudo ln -s /usr/share/fonts/truetype/****.ttf .

Install: jsonlint, jslint
---------------------------------

    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs
    sudo npm -g install jsonlint jslint
