#!/bin/sh

if [ $# -ne 2 ]; then
    echo "usage: $0 <version> <install_dir>"
    exit 1
fi

VERSION="$1"
INSTALL_DIR="$2"
NAME=apache-ant-$VERSION
FILE=$NAME-bin.tar.gz
URL=http://www.apache.org/dist/ant/binaries

. `readlink -e lib.sh`

make_install_dir $INSTALL_DIR
download $URL $FILE
tar xfz $FILE
rm -f $FILE
rm -f latest
ln -s $NAME latest

#---------
cd latest/lib
confirm "Install Maven Ant Task?"
if [ $? -eq 0 ] ; then
    VERSION=2.1.3
    FILE=maven-ant-tasks-$VERSION.jar
    URL=http://www.apache.org/dist/maven/ant-tasks/$VERSION/binaries
    download $URL $FILE
fi
#---------

#---------
confirm "Install Ivy?"
if [ $? -eq 0 ] ; then
    VERSION=2.3.0
    FILE=ivy-$VERSION.jar
    URL=http://repo1.maven.org/maven2/org/apache/ivy/ivy/$VERSION
    download $URL $FILE
fi
#---------

../bin/ant -version
