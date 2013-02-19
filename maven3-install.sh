#!/bin/sh

[ -z "$1" ] && echo "usage: $0 <version>" && exit 1

VERSION="$1"
NAME=apache-maven-$VERSION
FILE=$NAME-bin.tar.gz
URL=http://www.apache.org/dist/maven/maven-3/$VERSION/binaries
CHKSUM='md5sum -c --quiet'
CURL='curl -O -#'

#---------
cd /opt
mkdir -p maven3
if [ $? -ne 0 ] ; then
  exit 1
fi
cd maven3
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
echo ""
ln -s $NAME latest
latest/bin/mvn -version
#---------
