#!/bin/sh
LIBDIR=/usr/share/oem/lib
BINDIR=/opt/bin
RUNDIR=/var/run/screen

if [ `whoami` != root ];then
    echo "usage: sudo $0"
    exit 1
fi

install -m 755 -d $LIBDIR
install -m 755 -d $BINDIR
install -m 777 -d $RUNDIR

for file in libaudit.so.1 libpam.so.0 libtinfo.so.5
do
    cp -a $file $LIBDIR
done
ldconfig

cp -a screen $BINDIR

echo "screen command install done."
