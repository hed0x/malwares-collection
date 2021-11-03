@echo off

max.exe -l >PID.txt 

FINDSTR /i "RavMon.exe" PID.txt >RAV.txt 
FINDSTR /i "RavMond.exe" PID.txt >>RAV.txt
FINDSTR /i "CCenter.ext" PID.txt >>RAV.txt

FOR /F "eol=; tokens=1 delims= " %%1 in (RAV.txt) do max.exe -k %%1 

PING 127.1 -n 15  
DEL *.TXT;*.VBS;*.BAT;  