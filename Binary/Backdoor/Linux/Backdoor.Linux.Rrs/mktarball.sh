#!/bin/sh

name="rrs"
version="`cat rrs.c | grep '$Id: rrs.c,v' | cut -d' ' -f3`"
files="rrs.c md5.c md5.h sha1.c sha1.h farm9crypt.cc farm9crypt.h twofish2.cc twofish2.h xorcrypt.h Makefile README CHANGES rrs.1 openssl_scripts mktarball.sh"

echo "[i] making tarball..."
mkdir $name-$version
tar --exclude=CVS -cf temporaryplace-$version.tar $files
tar -C $name-$version -xf temporaryplace-$version.tar
rm -f $name-$version.tar.gz
tar -czf $name-$version.tar.gz $name-$version
rm -rf $name-$version
rm -rf temporaryplace-$version.tar
chmod 0644 $name-$version.tar.gz
echo "[i] done"

