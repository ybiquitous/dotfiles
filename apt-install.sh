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

# shell
list=$list' zsh zsh-doc'

# emacs
list=$list' emacs anthy-el js2-mode html-helper-mode yaml-mode'

# tool
list=$list' manpages-ja nkf lv tree rar unrar ntp lynx'

# system
list=$list' sysv-rc-conf acct'

# python
list=$list' ipython python3'

# java
list=$list' openjdk-6-jdk openjdk-6-doc openjdk-6-source'

# html
list=$list' tidy'

# git
list=$list' git-core git-doc git-svn git-cvs curl patch'

# cvs
list=$list' cvs'

# subversion
list=$list' subversion'

# clamav
#list=$list' clamav'

apt-get $arg install $list

