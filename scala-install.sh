#!/bin/sh

if [ $# -ne 2 ]; then
    echo "usage: $0 <version> <install_dir>"
    exit 1
fi

VERSION="$1"
INSTALL_DIR="$2"
NAME=scala-$VERSION
FILE=$NAME.tgz
URL=http://scala-lang.org/files/archive

. `readlink -e lib.sh`

make_install_dir $INSTALL_DIR
axel $URL/$FILE
tar xfz $FILE
rm -f $FILE
rm -f latest
ln -s $NAME latest

./latest/bin/scala -version

mkdir -p $HOME/man/man1
cd $HOME/man/man1
for manfile in `find $INSTALL_DIR/latest/man/man1 -type f`; do
    ln -fs $manfile .
done
