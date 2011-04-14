#!/bin/sh

if [ -z $1 ] ; then
  echo "Usage: $0 target_dir"
  exit 1;
fi

dst_dir=$1
if test ! -e $dst_dir ; then
  echo "Not found $dst_dir"
  exit 1
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
  cp -riv $work_dir/HOME/$v $dst_dir/
  if test -d $dst_dir/$v ; then
    chmod -v 700 $dst_dir/$v
  elif test -f $dst_dir/$v ; then
    chmod -v 644 $dst_dir/$v
  fi
done
rm -rf $work_dir

exit 0
