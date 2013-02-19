#!/bin/sh

[ -z "$1" ] && echo "usage: $0 <version>" && exit 1

VERSION="$1"
DISTFILE=apache-ant-${VERSION}-bin.tar.gz
DISTDIR=apache-ant-${VERSION}
MIRROR=http://ftp.meisei-u.ac.jp/mirror/apache/dist

#---------
cd /opt
mkdir -p ant
if [ $? -ne 0 ] ; then
  exit 1
fi
cd ant
#---------

#---------
curl -O $MIRROR/ant/binaries/$DISTFILE
echo "`curl -s http://www.apache.org/dist/ant/binaries/$DISTFILE.md5` *$DISTFILE" | md5sum -c
if [ $? -ne 0 ] ; then
  echo "download error"
  exit 1;
fi
tar xfz $DISTFILE
rm -f $DISTFILE
#---------

#---------
rm -f latest
ln -s $DISTDIR latest
latest/bin/ant -version
#---------

#---------
version=2.1.3
file=maven-ant-tasks-$version.jar
cd latest/lib
curl -O $MIRROR/maven/ant-tasks/$version/binaries/$file
echo "`curl -s http://www.apache.org/dist/maven/ant-tasks/$version/binaries/$file.md5` *$file" | md5sum -c
#---------
