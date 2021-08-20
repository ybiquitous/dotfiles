#!/bin/bash
set -euo pipefail

gem update --system
gem update

gem install \
    goodcheck \
    querly
gem clean
gem list

bundle config --global path 'vendor/bundle'
bundle config
