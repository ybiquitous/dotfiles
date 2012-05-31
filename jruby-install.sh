#!/bin/sh

VERSION=1.7.0.preview1
DISTFILE=jruby-bin-${VERSION}.tar.gz
DISTDIR=jruby-${VERSION}

#---------
cd /opt
mkdir -p jruby
cd jruby
#---------

#---------
curl -O http://jruby.org.s3.amazonaws.com/downloads/$VERSION/$DISTFILE
curl -O http://jruby.org.s3.amazonaws.com/downloads/$VERSION/$DISTFILE.sha1
echo "`cat $DISTFILE.sha1`  $DISTFILE" > $DISTFILE.sha1
sha1sum -c $DISTFILE.sha1
if [ $? -ne 0 ] ; then
  echo "download error"
  exit 1;
fi
rm -f $DISTFILE.sha1
tar xfz $DISTFILE
#---------

#---------
ln -s $DISTDIR latest
latest/bin/jruby -v
#---------
