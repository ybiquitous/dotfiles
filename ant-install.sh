#!/bin/sh

[ -z "$1" ] && echo "usage: $0 <version>" && exit 1

VERSION="$1"
NAME=apache-ant-$VERSION
FILE=$NAME-bin.tar.gz
URL=http://www.apache.org/dist/ant/binaries

. `readlink -e lib.sh`

make_install_dir /opt/ant
download $URL $FILE
tar xfz $FILE
rm -f $FILE
ln -s $NAME latest

#---------
cd latest/lib
VERSION=2.1.3
FILE=maven-ant-tasks-$VERSION.jar
URL=http://www.apache.org/dist/maven/ant-tasks/$VERSION/binaries
download $URL $FILE
#---------

#---------
VERSION=2.3.0
FILE=ivy-$VERSION.jar
URL=http://repo1.maven.org/maven2/org/apache/ivy/ivy/$VERSION/
download $URL $FILE
#---------

echo ""
../bin/ant -version
