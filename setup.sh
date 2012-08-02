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

mkdir -pv $HOME/bin
cd $HOME/bin
CURRDIR=`pwd`

for target in $SRCDIR/bin/* ; do
    base=`basename $target`
    [ ! -L $CURRDIR/$base ] && ln -siv $target
done
