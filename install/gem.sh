#!/bin/sh
set -eu

gem update --system
gem update

gem install \
    commonmarker \
    escape_utils \
    goodcheck \
    html-pipeline \
    method_source \
    querly \
    rinku \
    stackprof
gem clean
gem list

bundle config --global path 'vendor/bundle'
bundle config
