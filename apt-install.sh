#!/bin/sh

if [ $1 = '--run' ]
then
  arg='-y'
else
  arg='-s'
fi

apt-get $arg update
apt-get $arg upgrade
apt-get $arg clean
apt-get $arg autoremove
apt-get $arg autoclean

# tool
list='manpages-ja nkf lv tree zsh rar unrar ntp lynx xml2'

# system
list=$list' sysv-rc-conf acct'

# emacs
list=$list' emacs anthy-el js2-mode html-helper-mode'

# python
list=$list' ipython python3'

# java
list=$list' openjdk-6-jdk openjdk-6-doc openjdk-6-source'

# html
list=$list' tidy'

# git
list=$list' git-core git-doc git-svn git-cvs'

# cvs
list=$list' cvs'

# subversion
list=$list' subversion'

# clamav
#list=$list' clamav'

apt-get $arg install $list

