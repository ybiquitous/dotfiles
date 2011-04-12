#!/bin/bash

if [ $0 != "./setup.sh" ]
then
  echo "Error!!! => '$0'"
  exit 1;
fi

target=(.aliases .env_vars .zshenv .zsh)
target_dir=$HOME

load() {
  for v in ${target[@]}
  do
    cp -vr $v $target_dir/
  done
}

save() {
  for v in ${target[@]}
  do
    cp -vr $target_dir/$v .
  done
}

case $1 in
  -r)
    save
    ;;
  *)
    load
    ;;
esac

exit 0
