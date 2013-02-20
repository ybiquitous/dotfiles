#!/bin/sh

[ -z "$1" ] && echo "usage: $0 <version>" && exit 1

VERSION="$1"
NAME=apache-maven-$VERSION
FILE=$NAME-bin.tar.gz
URL=http://www.apache.org/dist/maven/maven-3/$VERSION/binaries

. `readlink -e lib.sh`

make_install_dir /opt/maven3
download $URL $FILE
tar xfz $FILE
rm -f $FILE
ln -s $NAME latest

echo ""
latest/bin/mvn -version
