#!/bin/sh
set -eu

gem update --system
gem update
gem install bootsnap
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

# Create faster binstubs. See https://qiita.com/hanachin_/items/13c3d5aaa3ea56dd4e4c
readonly gems="goodcheck querly"
for gem in $gems; do
  binstub="${HOME}/bin/${gem}"
  cat <<EOF >"${binstub}"
#!/usr/bin/env ruby
require 'bootsnap'
gem_name = '${gem}'
exe_name = '${gem}'
cache_dir = File.join(ENV['HOME'], '.cache', 'bootsnap', gem_name, exe_name)
Bootsnap.setup(cache_dir: cache_dir, load_path_cache: false, autoload_paths_cache: false)
load Gem.bin_path(gem_name, exe_name)
EOF
  chmod +x "${binstub}"
  echo "Create binstub: ${binstub}"
done
