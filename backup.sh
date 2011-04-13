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
  .emacs.d/site-lisp/
  .emacs.d/auto-install/
  .xmodmap
  .gitconfig
)

for v in ${target[@]} ; do
  cp -rv $HOME/$v ./HOME/$v
done
