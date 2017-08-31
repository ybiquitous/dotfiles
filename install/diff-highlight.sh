#!/bin/sh
set -eu

readonly BIN_DIR="${HOME}/bin"
mkdir -pv "$BIN_DIR"
cd "$BIN_DIR"

curl -LO https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/DiffHighlight.pm
curl -LO https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight.perl
curl -LO https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/Makefile
make
rm -f -- *.pm *.perl Makefile
