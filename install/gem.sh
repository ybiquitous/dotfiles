#!/bin/sh
set -eux

gem update --system

gem install --no-document \
    bundler \
    commonmarker \
    goodcheck \
    escape_utils \
    github-markup \
    gist \
    html-pipeline \
    mdl \
    method_source \
    pry \
    pry-doc \
    querly \
    reek \
    rubocop \
    stackprof

gem update
gem list
