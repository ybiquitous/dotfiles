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

# byte compile emacs-lisp
read -p "Byte Compile *.el? [Y/n] " answer
case "$answer" in
    "n"|"N") exit ;;
    *)
        dirs=`find $SRCDIR/.emacs.d/ -maxdepth 1 -type d | sort --reverse`
        load_paths=''
        for d in $dirs ; do
            load_paths="${load_paths} -L ${d} "
        done
        for d in $dirs ; do
            rm -f $d/*.elc
            emacs $load_paths -batch -f batch-byte-compile `find $d -name '*.el' | sort --reverse` || exit 1
        done
        ;;
esac
