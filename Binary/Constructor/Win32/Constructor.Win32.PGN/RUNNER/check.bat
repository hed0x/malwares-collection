@echo off
..\SYSTEM\CHECK\check.exe .. >check.log
if errorlevel 1 goto error
echo all OK
goto exit
:error
echo *** there are ERRORs. see CHECK.LOG for details ***
:exit
