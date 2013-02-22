#!/bin/sh

[ -z "$1" ] && echo "usage: $0 <version>" && exit 1

VERSION="$1"
NAME=scala-$VERSION
FILE=$NAME.tgz
URL=http://www.scala-lang.org/downloads/distrib/files

. `readlink -e lib.sh`

make_install_dir /opt/scala
download $URL $FILE
tar xfz $FILE
rm -f $FILE
ln -s $NAME latest

./latest/bin/scala -version
