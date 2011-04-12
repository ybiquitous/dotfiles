#!/bin/bash

if [ $0 != "./backup.sh" ]
then
  echo "Error!!! => '$0'"
  exit 1;
fi

target=(
  .aliases
  .env_vars
  .zshenv
  .zsh/.zshrc
  .emacs
  .xmodmap
)

for v in ${target[@]} ; do
  cp -v $HOME/$v ./HOME/$v
done
