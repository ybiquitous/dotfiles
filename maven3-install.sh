#!/bin/sh

if [ $# -ne 2 ]; then
    echo "usage: $0 <version> <install_dir>"
    exit 1
fi

VERSION="$1"
INSTALL_DIR="$2"
NAME=apache-maven-$VERSION
FILE=$NAME-bin.tar.gz
URL=http://www.apache.org/dist/maven/maven-3/$VERSION/binaries

. `readlink -e lib.sh`

make_install_dir $INSTALL_DIR
download $URL $FILE
tar xfz $FILE
rm -f $FILE
ln -s $NAME latest

echo ""
latest/bin/mvn -version
