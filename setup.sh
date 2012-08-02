#!/bin/sh

SRCDIR=`dirname \`readlink -f $0\``/HOME

cd $HOME
CURRDIR=`pwd`

for target in $SRCDIR/.* ; do
  base=`basename $target`
  case "$base" in
    "." | ".." ) continue ;;
  esac
  [ ! -L $CURRDIR/$base ] && ln -siv $target
done
