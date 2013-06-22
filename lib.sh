#!/bin/sh

download () {
    if [ $# -ne 2 ] ; then
        echo "usage: download <url> <file>"
        exit 1
    fi
    url="$1"
    file="$2"

    echo "[download] $url/$file"
    axel $url/$file
    echo "`curl -s $url/$file.md5 | awk '{ print $1 }'` *$file" | md5sum -c --quiet
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
    if [ ! -d $dir ] ; then
        mkdir -p $dir
        echo "[create] $dir"
    fi
    cd $dir
}

confirm () {
    if [ $# -ne 1 ] ; then
        echo "usage: confirm <message>"
        exit 1
    fi
    msg="$1"

    while true ; do
        read -p "$msg [y/n]: " answer
        case $answer in
            [Yy]* ) return 0 ;;
            [Nn]* ) return 1 ;;
            * ) echo "Please answer yes or no." ;;
        esac
    done
}
