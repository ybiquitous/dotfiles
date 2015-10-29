#!/bin/sh

########################################################################
#
# See README on [https://github.com/jcgay/maven-color]
#
# ONLY FOR Maven >=3.1.x
#
########################################################################

if [ ! -d "$1" -o ! -n "$2" ]; then
  echo "usage: $0 {maven_home} {version}"
  exit 1
fi

MAVEN_HOME="$1"
VERSION="$2"
DISTFILE="maven-color-logback-${VERSION}-bundle.tar.gz"

cd "${MAVEN_HOME}"

if [ ! -f "${DISTFILE}" ]; then
  curl -L -O "http://dl.bintray.com/jcgay/maven/com/github/jcgay/maven/color/maven-color-logback/${VERSION}/${DISTFILE}"
  tar xvfz "${DISTFILE}"
fi

for file in $(find ./lib -type f -name "slf4j-simple-*.jar") ; do
  mv -fv "${file}" "${file}.bak"
done

"${MAVEN_HOME}/bin/mvn" help:help
