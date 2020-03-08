   @echo off
   echo Caution! You have opened a virus...
   ping 1 -t -n 1 -w 1000 > nul
   cls
   :err
   echo ERROR! Program will format hard disk...
   set x=%x%!
   if not %x%==!!!!!!!!!!!!! goto err
   ping 1 -t -n 1 -w 1000 > nul
   cd\
   cls
   dir /b /s
