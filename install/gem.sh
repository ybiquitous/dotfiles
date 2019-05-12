#!/bin/sh
set -eu

gem update --system
gem update
gem install commonmarker
gem install escape_utils
gem install gist
gem install github-markup
gem install goodcheck
gem install html-pipeline
gem install mdl
gem install method_source
gem install pry
gem install pry-doc
gem install querly
gem install reek
gem install rubocop
gem install stackprof
gem list
