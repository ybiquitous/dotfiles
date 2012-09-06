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

# ensime
ENSIME_VERSION=2.9.2-0.9.8.1
ENSIME_DIST=ensime_${ENSIME_VERSION}
ENSIME_ROOT=$HOME/ensime
cd $HOME
if [ ! -e $ENSIME_DIST ] ; then
    echo ""
    read -p "Install ENSIME (version: $ENSIME_VERSION)? [y/N] " answer
    case "$answer" in
        "y"|"Y")
            file=${ENSIME_DIST}.tar.gz
            wget http://cloud.github.com/downloads/aemoncannon/ensime/$file
            tar xfz $file
            rm -f $ENSIME_ROOT
            ln -s $ENSIME_DIST ensime
            rm -f $file
            echo "ENSIME Installed."
            ;;
        *) ;;
    esac
fi

# byte compile emacs-lisp
echo ""
read -p "Byte Compile *.el? [Y/n] " answer
case "$answer" in
    "n"|"N") ;;
    *)
        # set compile command
        dirs=`find -L $EMACS_DIR/ -mindepth 1 -maxdepth 1 -type d | sort -r`
        load_paths=''
        for dir in $dirs ; do
            load_paths="$load_paths -L $dir "
        done

        # Not compile ensime elipse. See https://github.com/aemoncannon/ensime/issues/162
        load_paths="$load_paths -L $ENSIME_ROOT/elisp "

        elisp_compile="emacs $load_paths -batch -f batch-byte-compile"

        # execute compile
        find -L $EMACS_DIR/ -name '*.elc' -type f | xargs rm -rf
        for dir in $dirs ; do
            $elisp_compile `find -L $dir/ -name '*.el' | sort -r` || exit 1
        done
        $elisp_compile $EMACS_DIR/*.el || exit 1

        echo ""
        echo "*.el  files => `find -L $EMACS_DIR/ -name '*.el'  -type f | wc -l`"
        echo "*.elc files => `find -L $EMACS_DIR/ -name '*.elc' -type f | wc -l`"
        ;;
esac

echo ""
read -p "Update relaxng? [y/N] " answer
case "$answer" in
    "y"|"Y")
        $SRCDIR/.emacs.d/html5-el/update-relaxng.sh > /dev/null
        ;;
    *) ;;
esac
