#!/bin/sh

########################################################################
#
# See README on [https://github.com/jcgay/maven-color]
#
# ONLY FOR Maven 3.1.x
#
########################################################################

if [ ! -d "$1" ]; then
  echo "usage: $0 {maven_home}"
  exit 1
fi

MAVEN_HOME="$1"
VERSION=1.0
SLF4J_DEFAULT_IMPL=slf4j-simple-1.7.5.jar

cd ${MAVEN_HOME}
curl -L -O "http://dl.bintray.com/jcgay/maven/com/github/jcgay/maven/color/maven-color-logback/${VERSION}/maven-color-logback-${VERSION}-bundle.tar.gz"
tar xvfz maven-color-logback-${VERSION}-bundle.tar.gz
cp -rfv maven-color-logback-${VERSION}/* ./

if [ -f lib/${SLF4J_DEFAULT_IMPL} ]; then
  mv -f lib/${SLF4J_DEFAULT_IMPL} lib/${SLF4J_DEFAULT_IMPL}.bak
fi

rm -rfv maven-color-*

${MAVEN_HOME}/bin/mvn help:help
