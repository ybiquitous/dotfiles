#!/bin/sh

SRCDIR=`dirname \`readlink -f $0\``/HOME
EMACS_DIR=$SRCDIR/.emacs.d

cd $HOME
CURRDIR=`pwd`

for target in $SRCDIR/.* ; do
    base=`basename $target`
    case "$base" in
        "." | ".." ) continue ;;
    esac
    test -L $CURRDIR/$base || ln -siv $target
done

# bin
mkdir -pv $HOME/bin
cd $HOME/bin
CURRDIR=`pwd`
for target in $SRCDIR/bin/* ; do
    base=`basename $target`
    test -L $CURRDIR/$base || ln -siv $target
done
