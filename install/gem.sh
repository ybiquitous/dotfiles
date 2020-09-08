#!/bin/sh
set -eu

gem update --system
gem update --no-document

readonly gem_install="gem install --no-document"
$gem_install bootsnap
$gem_install bundler
$gem_install commonmarker
$gem_install escape_utils
$gem_install goodcheck
$gem_install html-pipeline
$gem_install method_source
$gem_install querly
$gem_install rinku
$gem_install screengif
$gem_install stackprof

gem list

# Configure Bundler
bundle config --global path 'vendor/bundle'
bundle config

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
