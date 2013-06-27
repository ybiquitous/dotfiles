#!/bin/sh

if [ $# -ne 2 ]; then
    echo "usage: $0 <version> <install_dir>"
    exit 1
fi

VERSION="$1"
INSTALL_DIR="$2"
NAME=scala-$VERSION
FILE=$NAME.tgz
URL=http://www.scala-lang.org/downloads/distrib/files

. `readlink -e lib.sh`

make_install_dir $INSTALL_DIR
download $URL $FILE
tar xfz $FILE
rm -f $FILE
ln -s $NAME latest

./latest/bin/scala -version
