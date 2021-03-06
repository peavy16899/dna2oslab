#/bin/bash
set -xe

MEDIR=$(cd `dirname $0`; pwd)
ME=tar-1.27

cd $MEDIR
source common.sh

cd ..
rm -rf $ME
tar Jxf $SRCTARBALL/$ME.tar.xz
cd $ME
mkdir -p dist

sed -i "s/^mkfifo/_mkfifo/" gnu/mkfifo.c

./configure $CONFIGFLAGS --prefix=$MEDIR/../$ME/dist/

make
make_install $ME

