   @echo off
   ::Another DVL creation
   @attrib C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\*.* -s -h -r +a
   @ren C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\avp0***.avc dvl.001 >nul
   @ren C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\up0*****.avc dvl.002 >nul
   @ren C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\daily.avc dvl.003 >nul
   @attrib C:\PROGRA~1\COMMON~1\AVPSHA~1\AVPBASES\*.00* +s +h +r +a
   ::dvl2003ro@yahoo.co.uk
   cls
