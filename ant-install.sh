#!/bin/sh

VERSION=1.8.3
DISTFILE=apache-ant-${VERSION}-bin.tar.gz
DISTDIR=apache-ant-${VERSION}

#---------
cd /opt
mkdir ant
if [ $? -ne 0 ] ; then
  exit 1
fi
cd ant
#---------

#---------
curl -O http://ftp.meisei-u.ac.jp/mirror/apache/dist/ant/binaries/$DISTFILE
curl -O http://www.apache.org/dist/ant/binaries/$DISTFILE.md5
echo "`cat $DISTFILE.md5`  $DISTFILE" > $DISTFILE.md5
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
latest/bin/ant -version
#---------
