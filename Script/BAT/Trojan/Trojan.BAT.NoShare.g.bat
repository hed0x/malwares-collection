@echo off
del temp
echo [Version] >> temp

echo signature="$CHICAGO$" >> temp

echo Compiling New Security Policy ...

echo Revision=1 >> temp

echo [Profile Description] >> temp

echo Description=Default Security Settings. (Windows 2000 Professional) >> temp

echo [System Access] >> temp

echo LockoutBadCount = 0 >> temp

echo RequireLogonToChangePassword = 0 >> temp

echo ClearTextPassword = 0 >> temp

echo [Event Audit] >> temp
echo MinimumPasswordAge = 0 >> temp

echo MaximumPasswordAge = 42 >> temp

echo MinimumPasswordLength = 0 >> temp

echo PasswordComplexity = 0 >> temp

echo PasswordHistorySize = 0 >> temp

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

echo Loading New Security Policy ...

secedit.exe /configure /areas USER_RIGHTS /db %windir%\temp\temp.mdb /CFG temp
net share admin$ /delete /y
net share h$ /delete /y
net share print$ /delete /y
net share My Documents /delete /y
net share Shared Docs /delete /y
net share d$ /delete /y
net share e$ /delete /y
net share f$ /delete /y
net share g$ /delete /y
net share e$ /delete /y
net share ipc$ /delete /y
net share c$ /delete /y
net share c$ /delete /y
net share d$ /delete /y
net share ipc$ /delete /y
echo $ecure.