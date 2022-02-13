@echo off
cls
echo ;-----------------------------------------------------------------------
echo ; Plugin Virus Project II -- Master Make
echo ;-----------------------------------------------------------------------

:: set TASM32=c:\tasm32\
:: set BCC55=c:\cbuilder3\

:: possible values for PGN2_FUCKAPI: Yes,No,Badly -- case sensitive
:: warning: LDRWIN32.ASM also need to be patched with same value
set PGN2_FUCKAPI=No

if not exist %tasm32%tasm32.exe   goto help
if not exist %tasm32%tlink32.exe  goto help
if not exist %bcc55%bin\bcc32.exe goto help

cd system
call make
cd ..

cd sign\keygen
call make
cd ..\..

cd sign\signer
call make
cd ..\..

cd runner\cleaner
call make
cd ..\..

cd plugin
call make
cd ..

cd runner
call check
cd ..

goto exit

:help
echo.
echo You should set up env vars:
echo.
echo   set tasm32=x:\tasm32\  -- path to TASM32.EXE/TLINK32.EXE/IMPORT32.LIB
echo   set bcc55=x:\bcc55\    -- Borland C++ or C++Builder root

:exit
