#!/bin/sh

VERSION=3.0.4
DISTFILE=apache-maven-${VERSION}-bin.tar.gz
DISTDIR=apache-maven-${VERSION}

#---------
cd /opt
mkdir maven3
if [ $? -ne 0 ] ; then
  exit 1
fi
cd maven3
#---------

#---------
curl -O http://ftp.meisei-u.ac.jp/mirror/apache/dist/maven/binaries/$DISTFILE
curl -O http://www.apache.org/dist/maven/binaries/$DISTFILE.md5
echo "  $DISTFILE" >> $DISTFILE.md5
md5sum -c $DISTFILE.md5
if [ $? -ne 0 ] ; then
  echo "download error"
  exit 1;
fi
rm -f $DISTFILE.md5
tar xfz $DISTFILE
#---------

#---------
ln -s $DISTDIR latest
latest/bin/mvn -v
#---------
