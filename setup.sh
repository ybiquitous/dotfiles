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
        dirs=`find $SRCDIR/.emacs.d/ -mindepth 1 -maxdepth 1 -type d | sort -r`
        load_paths=''
        for d in $dirs ; do
            load_paths="${load_paths} -L ${d} "
        done
        for d in $dirs ; do
            rm -f $d/*.elc
            emacs $load_paths -batch -f batch-byte-compile `find $d -name '*.el' | sort -r` || exit 1
        done
        emacs $load_paths -batch -f batch-byte-compile $SRCDIR/.emacs.d/init.el || exit 1

        # which svn && svn up $SRCDIR/.emacs.d/html5-el/relaxng
        ;;
esac
