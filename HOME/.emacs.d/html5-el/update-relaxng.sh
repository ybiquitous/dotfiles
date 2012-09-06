#!/bin/sh
which svn >/dev/null && rm -rf relaxng && svn export http://whattf.svn.cvsdude.com/syntax/trunk/relaxng/ relaxng
