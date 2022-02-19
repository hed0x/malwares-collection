@echo off
if /%1==/ goto exit
if /%2==/ goto exit
if /%3==/ goto exit
if NOT /%4==/ goto exit

if exist %1.obj del %1.obj
if exist %1.exe del %1.exe
if exist %1.tds del %1.tds
if exist %1.tmp del %1.tmp
if exist %1.pgn del %1.pgn

if not exist %bcc55%bin\bcc32.exe goto exit
if not exist %tasm32%tasm32.exe   goto exit
if not exist %tasm32%tlink32.exe  goto exit
if not exist ..\..\SYSTEM\PE2PGN\pe2pgn.exe  goto exit
if not exist ..\..\SYSTEM\PACKER\packer.exe  goto exit
if not exist ..\..\SYSTEM\HEADER\header.exe  goto exit
if not exist ..\..\SYSTEM\CHECK\check.exe    goto exit

%BCC55%bin\bcc32.exe -c -3 -C -P -pr -ff -O2 -lap -u- -I%BCC55%include -H -H=%TEMP%\1.csm %1.cpp
if not exist %1.obj goto error

%tasm32%tlink32 -n -x -c -Tpe ..\..\SYSTEM\CPPSYS\cppsys.obj %1.obj,%1.exe,,%tasm32%import32.lib,%1.def
if not exist %1.exe goto error

..\..\SYSTEM\PE2PGN\pe2pgn %1.exe %1.tmp %3 /q
if not exist %1.tmp goto error

..\..\SYSTEM\PACKER\packer c %1.tmp %1.pgn /q
if not exist %1.pgn goto error

..\..\SYSTEM\HEADER\header %1.pgn %2 /q

if exist %1.obj del %1.obj
if exist %1.tds del %1.tds
if exist %1.tmp del %1.tmp
if exist %1.exe del %1.exe

echo --- writing %1.log ---
..\..\SYSTEM\CHECK\check.exe %1.pgn >%1.log

goto exit
:error
echo *** ERROR ***
:exit
