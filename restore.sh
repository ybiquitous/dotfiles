#!/bin/sh

if [ -z $1 ] ; then
  echo "Usage: $0 target_dir"
  exit 1;
fi

work_dir=/tmp/restore`date +%s`
if test -e $work_dir ; then
  echo "Already exists $work_dir"
  exit 1
fi

rm -rf $work_dir
mkdir -p $work_dir
git clone https://github.com/ybiquitous/dotfiles.git $work_dir
for v in `ls -a $work_dir/HOME/` ; do
  if [ $v = '.' -o $v = '..' ] ; then
    continue
  fi
  cp -rfv $work_dir/HOME/$v $1/
done
rm -rf $work_dir

exit 0
