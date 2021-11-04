@Echo Off
if exist naulla goto END
ping 127.0.0.1 -n 12 -w 10000
Set date=%date%
call 666.bat
ping 127.0.0.1 -n 15 -w 1000
call 123.exe >naulla
date %date%
:END