#!/bin/sh

download () {
    if [ $# -ne 2 ] ; then
        echo "usage: download <url> <file>"
        return 1
    fi
    url="$1"
    file="$2"

    echo "[download] $url/$file"
    curl -O -# $url/$file
    echo "`curl -s $url/$file.md5` *$file" | md5sum -c --quiet
    if [ $? -ne 0 ] ; then
        echo "[FAILED DOWNLOAD] $url/$file"
        rm -f $file
        return 1
    fi
    return 0
}
