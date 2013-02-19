#!/bin/sh

[ -z "$1" ] && echo "usage: $0 <version>" && exit 1

VERSION="$1"
NAME=apache-ant-$VERSION
FILE=$NAME-bin.tar.gz
URL=http://www.apache.org/dist/ant/binaries
CHKSUM='md5sum -c --quiet'
CURL='curl -O -#'

#---------
cd /opt
mkdir -p ant
if [ $? -ne 0 ] ; then
  exit 1
fi
cd ant
#---------

#---------
$CURL $URL/$FILE
echo "`curl -s $URL/$FILE.md5` *$FILE" | $CHKSUM
if [ $? -ne 0 ] ; then
  echo "download error"
  exit 1;
fi
tar xfz $FILE
rm -f $FILE
#---------

#---------
rm -f latest
ln -s $NAME latest
#---------

#---------
VERSION=2.1.3
FILE=maven-ant-tasks-$VERSION.jar
URL=http://www.apache.org/dist/maven/ant-tasks/$VERSION/binaries
cd latest/lib
$CURL $URL/$FILE
echo "`curl -s $URL/$FILE.md5` *$FILE" | $CHKSUM
#---------

echo ""
../bin/ant -version
