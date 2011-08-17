#!/bin/sh

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
mkdir -p $dst_dir/bin

cmd='cp -fv'
$cmd $src_dir/.aliases ./$dst_dir/
$cmd $src_dir/.exports ./$dst_dir/
$cmd $src_dir/.zshenv ./$dst_dir/
$cmd $src_dir/.zsh/.zshrc ./$dst_dir/.zsh/
$cmd $src_dir/.emacs ./$dst_dir/
$cmd $src_dir/.emacs.d/site-lisp/*.el ./$dst_dir/.emacs.d/site-lisp/
$cmd $src_dir/.emacs.d/auto-install/*.el ./$dst_dir/.emacs.d/auto-install
$cmd $src_dir/.xmodmap ./$dst_dir/
$cmd $src_dir/.gitconfig ./$dst_dir/
$cmd $src_dir/.irbrc ./$dst_dir/
$cmd $src_dir/.lv ./$dst_dir/
$cmd $src_dir/bin/beep ./$dst_dir/bin/
$cmd $src_dir/bin/termlog ./$dst_dir/bin/
$cmd $src_dir/bin/to_eshell_alias ./$dst_dir/bin/
