#!/bin/sh

download () {
    if [ $# -ne 2 ] ; then
        echo "usage: download <url> <file>"
        exit 1
    fi
    url="$1"
    file="$2"

    echo "[download] $url/$file"
    curl -O -# $url/$file
    echo "`curl -s $url/$file.md5` *$file" | md5sum -c --quiet
    if [ $? -ne 0 ] ; then
        echo "[FAILED DOWNLOAD] $url/$file"
        rm -f $file
        exit 1
    fi
    return 0
}

make_install_dir () {
    if [ $# -ne 1 ] ; then
        echo "usage: make_install_dir <directory>"
        exit 1
    fi
    dir="$1"
    if [ -d $dir ] ; then
        echo "[ALREADY EXISTS] $dir"
        exit 1
    fi

    mkdir -p $dir
    cd $dir
    echo "[create] $dir"
}
