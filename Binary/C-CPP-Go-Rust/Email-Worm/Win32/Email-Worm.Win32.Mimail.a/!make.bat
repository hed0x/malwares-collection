   @echo off
   cls
   del *.exe
   del *.obj
   del err.txt
   del logfile.txt
   c:\lcc\bin\lcc -A -errout=err.txt -DNDEBUG test.c
   c:\lcc\bin\lcclnk -s -subsystem windows test.obj eml.lib kernel32.lib wsock32.lib iphlpapi.lib
