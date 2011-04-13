#!/bin/bash

if [ $0 != "./backup.sh" ]
then
  echo "Error!!! => '$0'"
  exit 1;
fi

src_dir=$HOME
dst_dir=./HOME

rm -rf $dst_dir
mkdir -p $dst_dir
mkdir -p $dst_dir/.zsh
mkdir -p $dst_dir/.emacs.d/site-lisp
mkdir -p $dst_dir/.emacs.d/auto-install

cmd='cp -fv'
$cmd $src_dir/.aliases ./$dst_dir/
$cmd $src_dir/.env_vars ./$dst_dir/
$cmd $src_dir/.zshenv ./$dst_dir/
$cmd $src_dir/.zsh/.zshrc ./$dst_dir/.zsh/
$cmd $src_dir/.emacs ./$dst_dir/
$cmd $src_dir/.emacs.d/site-lisp/*.el ./$dst_dir/.emacs.d/site-lisp/
$cmd $src_dir/.emacs.d/auto-install/*.el ./$dst_dir/.emacs.d/auto-install
$cmd $src_dir/.xmodmap ./$dst_dir/
$cmd $src_dir/.gitconfig ./$dst_dir/
