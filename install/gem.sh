#!/bin/sh
set -eu

echo "Updating system gem..."
gem update --system

echo
echo "Installing gems..."
gem install --no-ri --no-rdoc \
    bundler \
    commonmarker \
    escape_utils \
    github-markup \
    gist \
    html-pipeline \
    mdl \
    method_source \
    pry \
    pry-doc \
    reek \
    rubocop \
    stackprof

echo
gem update

echo
gem list
