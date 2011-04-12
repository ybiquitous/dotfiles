#!/bin/sh

rm -rf masafumi-k
git clone https://github.com/ybiquitous/masafumi-k.git
cd masafumi-k
rm -rf `find -name .git*`
for v in `ls HOME/.*` ; do
  cp -rv $v $HOME
done
cd ..
rm -rf masafumi-k
