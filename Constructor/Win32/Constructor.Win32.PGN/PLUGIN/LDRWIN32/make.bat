@echo off

if %PGN2_FUCKAPI%==Yes   goto yes
if %PGN2_FUCKAPI%==Badly goto badly
set ttt=/DPGN2_FUCKAPI_NO
goto both
:yes
set ttt=/DPGN2_FUCKAPI_YES
goto both
:badly
set ttt=/DPGN2_FUCKAPI_BADLY
:both

call ..\maketasm ldrwin32 ver1 priority5 %ttt%
if not exist ldrwin32.pgn goto exit

if exist ldrwin32.bin del ldrwin32.bin
%tasm32%tasm32.exe /ml /m /z ldrwin32.asm %ttt%
%tasm32%tlink32.exe -x -c -Tpe ldrwin32.obj,ldrwin32.bin,,%tasm32%import32.lib,ldrwin32.def
del ldrwin32.obj
..\..\SYSTEM\HAXOR\haxor ldrwin32.bin ldrwin32.bin /bin /S=[start] /E=[end] /q

set ttt=
:exit
